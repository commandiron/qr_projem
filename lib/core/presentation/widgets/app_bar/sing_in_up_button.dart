import 'package:flutter/material.dart';
import 'package:qr_projem/auth/presentation/auth_screen.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';

import '../../../../auth/presentation/sections/sign_in.dart';

class SignInUpButton extends StatelessWidget {
  const SignInUpButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignIn.pageIndex);
          },
          child: const Text("Giriş Yap")
        ),
        AppSpace.horizontalL!,
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignUp.pageIndex);
            },
            child: const Text("Kayıt Ol")
        ),
      ],
    );
  }
}
