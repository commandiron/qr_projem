import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  PageController pageController;
  TextEditingController textEditingController;
  bool isLoading;
  String textFieldErrorMessage;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.pageController,
      required this.textEditingController,
      required this.isLoading,
      required this.textFieldErrorMessage,
      required this.phoneFormatter,
    }
  );
}
