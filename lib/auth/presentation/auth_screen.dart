import 'package:flutter/material.dart';
import 'package:qr_projem/registration/presentation/registration_screen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const route = "/auth";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Auth Screen"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(RegistrationScreen.route);
              },
              child: Text("To Registration Screen")
            )
          ],
        ),
      ),
    );
  }
}
