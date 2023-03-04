import 'package:flutter/material.dart';

class AuthState {
  AuthPageState authPageState;
  PageController pageController;
  TextEditingController textEditingController;
  String textFieldErrorMessage;

  AuthState(
    {
      required this.authPageState,
      required this.pageController,
      required this.textEditingController,
      required this.textFieldErrorMessage,
    }
  );

  AuthState copyWith(
    {
      AuthPageState? authPageState,
      PageController? pageController,
      TextEditingController? textEditingController,
      String? textFieldErrorMessage,
    }
  ) {
    return AuthState(
      authPageState: authPageState ?? this.authPageState,
      pageController: pageController ?? this.pageController,
      textEditingController: textEditingController ?? this.textEditingController,
      textFieldErrorMessage: textFieldErrorMessage ?? this.textFieldErrorMessage,
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
