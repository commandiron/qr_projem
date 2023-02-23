import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {

  final auth = FirebaseAuth.instance;
  late ConfirmationResult confirmationResult;

  Future<User?> getFirebaseUser() async {
    final user = await auth.authStateChanges().first;
    return user;
  }

  void singInWithPhoneNumber(String phoneNumber, {void Function()? onSuccess}) async {
    FirebaseAuthPlatform authPlatform = FirebaseAuthPlatform.instanceFor(
      app: Firebase.apps.first,
      pluginConstants: {},
    );
    confirmationResult =  await auth.signInWithPhoneNumber(
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

  Future<void> signOut() async {
    await auth.signOut();
  }
}