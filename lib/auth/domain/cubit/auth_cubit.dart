import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import 'package:qr_projem/auth/presentation/sections/sign_in.dart';
import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/sections/verification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.authRepository, int? initialPage) : super(
    AuthState(
      pageController: PageController(initialPage: initialPage ?? 0),
      textEditingController: TextEditingController(),
      textFieldErrorMessage: "",
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      ),
      isLoading: false
    )
  );

  final AuthRepository authRepository;

  void singInWithPhoneNumber() async {

    validatePhoneNumber();

    if(state.textFieldErrorMessage.isEmpty) {
      emit(copyStateWith(isLoading: true));
      authRepository.singInWithPhoneNumber(
        "+90${state.phoneFormatter.getUnmaskedText()}",
        onSuccess: () {
          jumpToPage(Verification.pageIndex);
        },
        onError: () {  },
        onExpired: () {  },
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
    emit(copyStateWith(isLoading: true,));
    authRepository.singInVerification(
      verificationCode,
      onSuccess: () {
        emit(copyStateWith(isLoading: false,));
        jumpToPage(Done.pageIndex);
      },
      onError: () {
        emit(copyStateWith(isLoading: false,));
        jumpToPage(SignIn.pageIndex);
      },
    );
  }

  void jumpToPage(int index) {
    state.pageController.jumpToPage(index);
    emit(copyStateWith(isLoading: false,));
  }

  AuthState copyStateWith(
    {
      PageController? pageController,
      TextEditingController? textEditingController,
      String? textFieldErrorMessage,
      MaskTextInputFormatter? phoneFormatter,
      bool? isLoading,
    }
  ) {
    return AuthState(
      pageController: pageController ?? state.pageController,
      textEditingController: textEditingController ?? state.textEditingController,
      textFieldErrorMessage: textFieldErrorMessage ?? state.textFieldErrorMessage,
      phoneFormatter: phoneFormatter ?? state.phoneFormatter,
      isLoading: isLoading ?? state.isLoading,
    );
  }
}
