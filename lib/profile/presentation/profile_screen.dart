import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const route = "/profile";

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: CustomAppBar(),
      body: Center(
        child: Text(
          "Profile Screen"
        ),
      ),
    );
  }
}
