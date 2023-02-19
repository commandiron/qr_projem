import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {
  void singInWithPhoneNumber(String phoneNumber) async {
    FirebaseAuthPlatform authPlatform = FirebaseAuthPlatform.instanceFor(
      app: Firebase.apps.first,
      pluginConstants: {},
    );
    await FirebaseAuth.instance.signInWithPhoneNumber(
      phoneNumber,
      RecaptchaVerifier(
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark,
        auth: authPlatform,
      )
    );
  }
}