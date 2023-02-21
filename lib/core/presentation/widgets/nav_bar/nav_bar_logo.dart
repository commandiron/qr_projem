import 'package:flutter/material.dart';
import 'package:qr_projem/home/presentation/home_screen.dart';

class NavBarLogo extends StatelessWidget {
  const NavBarLogo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pushNamed(HomeScreen.route);
      },
      child: Image.asset("assets/images/logo/qr_projem_logo_with_text.png")
    );
  }
}
