import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {

  late ConfirmationResult confirmationResult;

  User? getFirebaseUser() {
    return FirebaseAuth.instance.currentUser;
  }

  void singInWithPhoneNumber(String phoneNumber, {void Function()? onSuccess}) async {
    FirebaseAuthPlatform authPlatform = FirebaseAuthPlatform.instanceFor(
      app: Firebase.apps.first,
      pluginConstants: {},
    );
    confirmationResult =  await FirebaseAuth.instance.signInWithPhoneNumber(
      phoneNumber,
      RecaptchaVerifier(
        size: RecaptchaVerifierSize.compact,
        theme: RecaptchaVerifierTheme.dark,
        auth: authPlatform,
        onSuccess: onSuccess
      )
    );
  }

  Future<void> singInVerification(String verificationCode) async {
    await confirmationResult.confirm(verificationCode);
  }
}