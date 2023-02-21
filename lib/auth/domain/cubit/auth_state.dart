import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  PageController pageController;
  bool isLoading;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.pageController,
      required this.isLoading,
      required this.phoneFormatter,
    }
  );
}
