import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  AuthPageState authPageState;
  PageController pageController;
  TextEditingController textEditingController;
  String textFieldErrorMessage;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.authPageState,
      required this.pageController,
      required this.textEditingController,
      required this.textFieldErrorMessage,
      required this.phoneFormatter,
    }
  );

  AuthState copyWith(
    {
      AuthPageState? authPageState,
      PageController? pageController,
      TextEditingController? textEditingController,
      String? textFieldErrorMessage,
      MaskTextInputFormatter? phoneFormatter,
    }
  ) {
    return AuthState(
      authPageState: authPageState ?? this.authPageState,
      pageController: pageController ?? this.pageController,
      textEditingController: textEditingController ?? this.textEditingController,
      textFieldErrorMessage: textFieldErrorMessage ?? this.textFieldErrorMessage,
      phoneFormatter: phoneFormatter ?? this.phoneFormatter,
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
