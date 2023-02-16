import 'package:flutter/material.dart';
import 'package:qr_projem/project/presentation/project_screen.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  static const route = "/registration";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text("Registration Screen"),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(ProjectScreen.route);
              },
              child: Text("To Project Screen")
            )
          ],
        ),
      ),
    );
  }
}
