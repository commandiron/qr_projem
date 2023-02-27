import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  AuthPageState authPageState;
  PageController pageController;
  TextEditingController textEditingController;
  String textFieldErrorMessage;
  MaskTextInputFormatter phoneFormatter;
  String snackBarErrorMessage;

  AuthState(
    {
      required this.authPageState,
      required this.pageController,
      required this.textEditingController,
      required this.textFieldErrorMessage,
      required this.phoneFormatter,
      required this.snackBarErrorMessage
    }
  );
}

enum AuthPageState{
 neutral, loading, error
}
