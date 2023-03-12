import 'package:flutter/material.dart';

import '../../../core/presentation/helper/ui_state.dart';

class AuthState {
  UiState uiState;
  PageController pageController;
  GlobalKey<FormState> phoneNumberFormKey;

  AuthState(
    {
      required this.uiState,
      required this.pageController,
      required this.phoneNumberFormKey,
    }
  );

  AuthState copyWith(
    {
      UiState? uiState,
      PageController? pageController,
      GlobalKey<FormState>? phoneNumberFormKey,
    }
  ) {
    return AuthState(
      uiState: uiState ?? this.uiState,
      pageController: pageController ?? this.pageController,
      phoneNumberFormKey: phoneNumberFormKey ?? this.phoneNumberFormKey,
    );
  }
}