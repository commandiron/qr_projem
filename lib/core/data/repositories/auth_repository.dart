import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_platform_interface/firebase_auth_platform_interface.dart';
import 'package:firebase_core/firebase_core.dart';

class AuthRepository {

  final auth = FirebaseAuth.instance;
  late ConfirmationResult confirmationResult;

  void getFirebaseUser({required void Function(User?) onResponse}) async {
    auth.authStateChanges().listen(
      (user) {
        onResponse(user);
      },
      onDone: () {
        print("onDone");
      },
      onError: (object, StackTrace error) {
        print("onError:");
      },
    );
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
        onSuccess: onSuccess,
        onError: (exception) {},
        onExpired: () {},
      )
    );
  }

  void singInVerification(
    String verificationCode,
    {
      required void Function() onSuccess,
      required void Function() onError
    }
    ) async {
    final userCredential =  await confirmationResult.confirm(verificationCode);
    if(userCredential != null) {
      onSuccess();
    } else {
      onError();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}