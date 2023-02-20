import 'package:flutter/material.dart';

import '../../config/app_padding.dart';
import '../../config/app_space.dart';
import 'nav_bar_logo.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      padding: AppPadding.horizontalL!.add(AppPadding.verticalM!),
      color: Colors.white,
      child: Row(
        children: [
          AppSpace.horizontalXL!,
          const NavBarLogo(),
        ],
      ),
    );
  }
}
