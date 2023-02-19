import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/pages/sign_in_page.dart';
import 'package:qr_projem/auth/presentation/pages/welcome_page.dart';

import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/pages/sign_up_page.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(
    AuthState(
      pages: [
        PageItem(
          index: 0,
          page: const WelcomePage()
        ),
        PageItem(
          index: 1,
          page: const SignUpPage()
      ),
      PageItem(
          index: 2,
          page: const SignInPage()
        ),
      ],
      pageIndex: 0,
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      )
    )
  );

  final AuthRepository _authRepository = AuthRepository();

  void singInWithPhoneNumber() async {
    _authRepository.singInWithPhoneNumber("+90${state.phoneFormatter.getUnmaskedText()}");
  }

  void jumpToPage(int index) {
    emit(
      AuthState(
        pages: state.pages,
        pageIndex: index,
        phoneFormatter: state.phoneFormatter
      )
    );
  }
}
