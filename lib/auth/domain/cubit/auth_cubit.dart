
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/sections/verification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.authRepository, int? initialPage) : super(
    AuthState(
      authPageState: AuthPageStateDone(),
      pageController: PageController(initialPage: initialPage ?? 0),
      textEditingController: TextEditingController(),
      textFieldErrorMessage: "",
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      ),
    )
  );

  final AuthRepository authRepository;

  void singInWithPhoneNumber() async {

    validatePhoneNumber();

    if(state.textFieldErrorMessage.isEmpty) {
      emit(state.copyWith(authPageState: AuthPageStateLoading()));
      authRepository.singInWithPhoneNumber(
        "+90${state.phoneFormatter.getUnmaskedText()}",
        onSuccess: () {
          jumpToPage(Verification.pageIndex);
        },
        onError: () {
          emit(state.copyWith(authPageState: AuthPageStateError("Doğrulama sağlanamadı."),)
          );
          jumpToPage(state.pageController.initialPage);
        },
        onTimeout: () {
          emit(state.copyWith(authPageState: AuthPageStateError("Doğrulama sağlanamadı."),)
          );
          jumpToPage(state.pageController.initialPage);
        },
      );
    }
  }

  void validatePhoneNumber() {
    final number = state.textEditingController.value.text;
    if(number.characters.length < 19) {
      emit(state.copyWith(textFieldErrorMessage: "Lütfen telefon numaranızı doğru giriniz."));
    } else {
      emit(state.copyWith(textFieldErrorMessage: ""));
    }
  }

  void singInVerification(String verificationCode) async {
    emit(state.copyWith(authPageState: AuthPageStateLoading()));
    authRepository.singInVerification(
      verificationCode,
      onSuccess: () {
        emit(state.copyWith(authPageState: AuthPageStateDone()));
        jumpToPage(Done.pageIndex);
      },
      onError: () {
        emit(state.copyWith(authPageState: AuthPageStateError("Kod doğrulanamadı.")));
        jumpToPage(state.pageController.initialPage);
      },
      onTimeout: () {
        emit(state.copyWith(authPageState: AuthPageStateError("Kod girilmedi.")));
        jumpToPage(state.pageController.initialPage);
      },
    );
  }

  void jumpToPage(int index) {
    state.pageController.jumpToPage(index);
    emit(state.copyWith(authPageState: AuthPageStateDone()));
  }

  Future<void> delayedJumpToPage(int index) async {
    emit(state.copyWith(authPageState: AuthPageStateLoading()));
    await Future.delayed(const Duration(seconds: 1));
    state.pageController.jumpToPage(index);
    emit(state.copyWith(authPageState: AuthPageStateDone()));
  }
}
