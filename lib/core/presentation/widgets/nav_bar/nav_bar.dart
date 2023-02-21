import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/widgets/nav_bar/sing_in_up_button.dart';

import '../../config/app_padding.dart';
import 'nav_bar_logo.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 96,
      padding: AppPadding.horizontalXXXL!.add(AppPadding.verticalM!),
      color: Theme.of(context).navigationBarTheme.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const NavBarLogo(),
          const SignInUpButton()
        ],
      ),
    );
  }
}
