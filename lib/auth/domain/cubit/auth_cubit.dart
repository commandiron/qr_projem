import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/sections/verification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(int? initialPage) : super(
    AuthState(
      pageController: PageController(initialPage: initialPage ?? 0),
      isLoading: false,
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      )
    )
  );

  final AuthRepository _authRepository = AuthRepository();

  void singInWithPhoneNumber() async {
    emit(
      copyStateWith(
        isLoading: true
      )
    );

    _authRepository.singInWithPhoneNumber(
      "+90${state.phoneFormatter.getUnmaskedText()}",
      onSuccess: () {
        jumpToPage(Verification.pageIndex);
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
    jumpToPage(Done.pageIndex);
  }

  void jumpToPage(int index) {
    state.pageController.jumpToPage(index);
    emit(
      copyStateWith(
        isLoading: false,
      )
    );
  }

  AuthState copyStateWith(
    {
      PageController? pageController,
      bool? isLoading,
      MaskTextInputFormatter? phoneFormatter,
    }
  ) {
    return AuthState(
      pageController: pageController ?? state.pageController,
      isLoading: isLoading ?? state.isLoading,
      phoneFormatter: phoneFormatter ?? state.phoneFormatter,
    );
  }
}
