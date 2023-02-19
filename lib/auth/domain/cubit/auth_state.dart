import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  List<PageItem> pages;
  int pageIndex;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.pages,
      required this.pageIndex,
      required this.phoneFormatter
    }
  );
}

class PageItem {
  int index;
  Widget page;
  PageItem(
    {
      required this.index,
      required this.page,
    }
);
}
