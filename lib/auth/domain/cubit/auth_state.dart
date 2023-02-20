import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class AuthState {
  bool isLoading;
  List<PageItem> pages;
  int pageIndex;
  MaskTextInputFormatter phoneFormatter;

  AuthState(
    {
      required this.isLoading,
      required this.pages,
      required this.pageIndex,
      required this.phoneFormatter,
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
