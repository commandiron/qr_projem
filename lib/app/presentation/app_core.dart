import 'package:flutter/material.dart';

import '../../admin/presentation/admin_screen.dart';
import '../../auth/presentation/auth_screen.dart';
import '../../core/presentation/config/app_config.dart';
import '../../home/presentation/home_screen.dart';

class AppCore extends StatelessWidget {
  const AppCore({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Qr Projem',
      initialRoute: AdminScreen.route,
      routes: {
        AdminScreen.route: (context) {
          return const AdminScreen();
        },
        HomeScreen.route: (context) {
          return const HomeScreen();
        },
        AuthScreen.route: (context) {
          return const AuthScreen();
        },
      },
    );
  }
}
