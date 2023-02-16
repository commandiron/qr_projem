import 'package:flutter/material.dart';
import 'package:qr_projem/overview/presentation/overview_screen.dart';

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
                Navigator.of(context).pushNamed(OverviewScreen.route);
              },
              child: Text("To Project Screen")
            )
          ],
        ),
      ),
    );
  }
}
