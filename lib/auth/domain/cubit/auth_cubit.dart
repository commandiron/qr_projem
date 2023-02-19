import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/pages/done_page.dart';
import 'package:qr_projem/auth/presentation/pages/sign_in_page.dart';
import '../../data/repository/auth_repository.dart';
import '../../presentation/pages/sign_up_page.dart';
import '../../presentation/pages/verification_page.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(
    AuthState(
      isUserAuthenticated: false,
      isLoading: false,
      pages: [
        PageItem(
          index: SignUpPage.pageIndex,
          page: const SignUpPage()
        ),
        PageItem(
          index: VerificationPage.pageIndex,
          page: const VerificationPage()
        ),
        PageItem(
          index: DonePage.pageIndex,
          page: const DonePage()
        ),
        PageItem(
          index: SignInPage.pageIndex,
          page: const SignInPage()
        ),
      ],
      pageIndex: SignUpPage.pageIndex,
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      )
    )
  );

  final AuthRepository _authRepository = AuthRepository();

  void getCurrentUser() {
    emit(
      copyStateWith(
        isUserAuthenticated: _authRepository.getFirebaseUser() != null
      )
    );
  }

  void singInWithPhoneNumber() async {
    emit(
      copyStateWith(
        isLoading: true
      )
    );

    _authRepository.singInWithPhoneNumber(
      "+90${state.phoneFormatter.getUnmaskedText()}",
      onSuccess: () {
        jumpToPage(VerificationPage.pageIndex);
      },
    );
  }

  void singInVerification(String verificationCode) async {
    emit(
      copyStateWith(
        isLoading: true
      )
    );
    await _authRepository.singInVerification(verificationCode);
    jumpToPage(DonePage.pageIndex);
  }

  void jumpToPage(int index) {
    emit(
      copyStateWith(
        isLoading: false,
        pageIndex: index
      )
    );
  }

  AuthState copyStateWith(
    {
      bool? isUserAuthenticated,
      bool? isLoading,
      List<PageItem>? pages,
      int? pageIndex,
      MaskTextInputFormatter? phoneFormatter,
    }
  ) {
    return AuthState(
      isUserAuthenticated: isUserAuthenticated ?? state.isUserAuthenticated,
      isLoading: isLoading ?? state.isLoading,
      pages: pages ?? state.pages,
      pageIndex: pageIndex ?? state.pageIndex,
      phoneFormatter: phoneFormatter ?? state.phoneFormatter
    );
  }
}
