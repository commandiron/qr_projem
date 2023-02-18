import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(
    AuthState(
      authPageController: PageController(),
      phoneFormatter: MaskTextInputFormatter(
        mask: '+90 (###) ###-##-##',
        filter: { "#": RegExp(r'[0-9]') },
        type: MaskAutoCompletionType.lazy
      )
    )
  );

  void singInWithPhoneNumber() async {
    FirebaseAuthPlatform authPlatform = FirebaseAuthPlatform.instanceFor(
      app: Firebase.apps.first,
      pluginConstants: {},
    );
    await FirebaseAuth.instance.signInWithPhoneNumber(
      "+90${state.phoneFormatter.getUnmaskedText()}",
      RecaptchaVerifier(
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark,
        auth: authPlatform,
      )
    );
  }
}
