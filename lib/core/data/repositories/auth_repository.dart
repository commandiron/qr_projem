import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';

class AuthRepository {

  final auth = FirebaseAuth.instance;
  ConfirmationResult? confirmationResult;

  Stream<User?> get user => auth.authStateChanges();

  void singInWithPhoneNumber(
      String phoneNumber,
      {
        required void Function() onSuccess,
        required void Function() onError,
        required void Function() onTimeout
      }
  ) async {
    try {
      confirmationResult =  await auth.signInWithPhoneNumber(phoneNumber,)
          .timeout(const Duration(minutes: 1));
      onSuccess();
    } on TimeoutException catch(_) {
      onTimeout();
    } on Exception catch(_) {
      onError();
    }
  }

  void singInVerification(
    String verificationCode,
    {
      required void Function() onSuccess,
      required void Function() onError,
      required void Function() onTimeout
    }
    ) async {
    try {
      await confirmationResult!
        .confirm(verificationCode)
        .timeout(const Duration(minutes: 1));
      onSuccess();
    } on TimeoutException catch(_) {
      onTimeout();
    } on Exception catch(_) {
      onError();
    }
  }

  Future<void> signOut() async {
    await auth.signOut();
  }
}