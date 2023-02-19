import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const route = "/profile";

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("Profile Screen"),
    );
  }
}
