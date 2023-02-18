import 'package:flutter/material.dart';
import 'package:qr_projem/auth/presentation/auth_screen.dart';
import 'package:qr_projem/overview/presentation/overview_screen.dart';
import 'package:qr_projem/admin/presentation/admin_screen.dart';
import 'package:qr_projem/registration/presentation/registration_screen.dart';

import 'config/app_config.dart';

class CoreApp extends StatelessWidget {
  const CoreApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Projem',
      initialRoute: AuthScreen.route,
      routes: {
        AdminScreen.route: (context) {
          return const AdminScreen();
        },
        AuthScreen.route: (context) {
          return const AuthScreen();
        },
        RegistrationScreen.route: (context) {
          return const RegistrationScreen();
        },
        OverviewScreen.route: (context) {
          return const OverviewScreen();
        },
      },
    );
  }
}