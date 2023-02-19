import 'package:flutter/cupertino.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthenticationState {
  List<PageItem> pages;
  int pageIndex;
  MaskTextInputFormatter phoneFormatter;

  AuthenticationState(
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
