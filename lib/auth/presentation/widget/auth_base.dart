import 'package:flutter/material.dart';

class AuthBase extends StatelessWidget {
  const AuthBase({required this.child, Key? key}) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: SizedBox(
        height: 512,
        width: double.infinity,
        child: child,
      ),
    );
  }
}
