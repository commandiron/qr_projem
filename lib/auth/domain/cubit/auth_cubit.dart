
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import '../../../core/data/repositories/auth_repository.dart';
import '../../presentation/sections/verification.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {

  AuthCubit(this.authRepository, int? initialPage) : super(
    AuthState(
      authPageState: AuthPageStateDone(),
      pageController: PageController(initialPage: initialPage ?? 0),
      phoneNumberFormKey: GlobalKey<FormState>(),
    )
  );

  final AuthRepository authRepository;

  void next() {
    if(state.phoneNumberFormKey.currentState!.validate()) {
      state.phoneNumberFormKey.currentState!.save();
    }
  }

  void singInWithPhoneNumber(String phoneNumber) async {
    emit(state.copyWith(authPageState: AuthPageStateLoading()));
    authRepository.singInWithPhoneNumber(
      phoneNumber,
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
