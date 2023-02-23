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
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignIn.pageIndex);
          },
          child: Text("Giriş Yap")
        ),
        AppSpace.horizontalL!,
        ElevatedButton(
            onPressed: () {
              Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignUp.pageIndex);
            },
            child: Text("Kayıt Ol")
        ),
      ],
    );
  }
}
