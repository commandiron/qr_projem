import 'package:flutter/material.dart';

class AuthState {
  AuthPageState authPageState;
  PageController pageController;
  GlobalKey<FormState> phoneNumberFormKey;

  AuthState(
    {
      required this.authPageState,
      required this.pageController,
      required this.phoneNumberFormKey,
    }
  );

  AuthState copyWith(
    {
      AuthPageState? authPageState,
      PageController? pageController,
      GlobalKey<FormState>? phoneNumberFormKey,
    }
  ) {
    return AuthState(
      authPageState: authPageState ?? this.authPageState,
      pageController: pageController ?? this.pageController,
      phoneNumberFormKey: phoneNumberFormKey ?? this.phoneNumberFormKey,
    );
  }
}

@immutable
abstract class AuthPageState {}

class AuthPageStateLoading extends AuthPageState {}

class AuthPageStateError extends AuthPageState {
  final String? message;
  AuthPageStateError([this.message]);
}
class AuthPageStateDone extends AuthPageState {}
