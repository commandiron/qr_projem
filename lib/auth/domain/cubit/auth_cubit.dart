
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';
import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/sections/verification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.authRepository, int? initialPage) : super(
    AuthState(
      authPageState: AuthPageState.neutral,
      pageController: PageController(initialPage: initialPage ?? 0),
      textEditingController: TextEditingController(),
      textFieldErrorMessage: "",
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      ),
      snackBarErrorMessage: ""
    )
  );

  final AuthRepository authRepository;

  void singInWithPhoneNumber() async {

    validatePhoneNumber();

    if(state.textFieldErrorMessage.isEmpty) {
      emit(copyStateWith(authPageState: AuthPageState.loading));
      authRepository.singInWithPhoneNumber(
        "+90${state.phoneFormatter.getUnmaskedText()}",
        onSuccess: () {
          jumpToPage(Verification.pageIndex);
        },
        onError: () {
          emit(
            copyStateWith(
              authPageState: AuthPageState.error,
              snackBarErrorMessage: "Doğrulama sağlanamadı."
            )
          );
          jumpToPage(SignUp.pageIndex);
        },
        onTimeout: () {
          emit(
            copyStateWith(
              authPageState: AuthPageState.error,
              snackBarErrorMessage: "Doğrulama sağlanamadı."
            )
          );
          jumpToPage(SignUp.pageIndex);
        },
      );
    }
  }

  void validatePhoneNumber() {
    final number = state.textEditingController.value.text;
    if(number.characters.length < 19) {
      emit(copyStateWith(textFieldErrorMessage: "Lütfen telefon numaranızı doğru giriniz."));
    } else {
      emit(copyStateWith(textFieldErrorMessage: ""));
    }
  }

  void singInVerification(String verificationCode) async {
    emit(copyStateWith(authPageState: AuthPageState.loading));
    authRepository.singInVerification(
      verificationCode,
      onSuccess: () {
        emit(copyStateWith(authPageState: AuthPageState.neutral));
        jumpToPage(Done.pageIndex);
      },
      onError: () {
        emit(
          copyStateWith(
            authPageState: AuthPageState.error,
            snackBarErrorMessage: "Kod doğrulanamadı."
          )
        );
        jumpToPage(SignUp.pageIndex);
      },
      onTimeout: () {
        emit(
          copyStateWith(
            authPageState: AuthPageState.error,
            snackBarErrorMessage: "Kod girilmedi."
          )
        );
        jumpToPage(SignUp.pageIndex);
      },
    );
  }

  void jumpToPage(int index) {
    state.pageController.jumpToPage(index);
    emit(copyStateWith(authPageState: AuthPageState.neutral));
  }

  Future<void> delayedJumpToPage(int index) async {
    emit(copyStateWith(authPageState: AuthPageState.loading));
    await Future.delayed(const Duration(seconds: 1));
    state.pageController.jumpToPage(index);
    emit(copyStateWith(authPageState: AuthPageState.neutral));
  }

  AuthState copyStateWith(
    {
      AuthPageState? authPageState,
      PageController? pageController,
      TextEditingController? textEditingController,
      String? textFieldErrorMessage,
      MaskTextInputFormatter? phoneFormatter,
      String? snackBarErrorMessage
    }
  ) {
    return AuthState(
      authPageState: authPageState ?? state.authPageState,
      pageController: pageController ?? state.pageController,
      textEditingController: textEditingController ?? state.textEditingController,
      textFieldErrorMessage: textFieldErrorMessage ?? state.textFieldErrorMessage,
      phoneFormatter: phoneFormatter ?? state.phoneFormatter,
      snackBarErrorMessage: snackBarErrorMessage ?? state.snackBarErrorMessage
    );
  }
}
