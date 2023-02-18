import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  PageController authPageController;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.authPageController,
      required this.phoneFormatter
    }
  );
}
