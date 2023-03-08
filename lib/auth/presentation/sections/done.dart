import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/profile/presentation/profile_screen.dart';

import '../widget/auth_base.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  static const pageIndex = 2;

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {

  @override
  void initState() {
    delayedNavigateToProfileScreen();
    super.initState();
  }

  void delayedNavigateToProfileScreen() async {
    await Future.delayed(const Duration(seconds: 2));
    if(context.mounted) {
      Navigator.of(context).pushNamed(ProfileScreen.route);
    }
  }

  @override
  Widget build(BuildContext context) {
    return AuthBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Giriş Başarılı", style: AppTextStyle.h3!,),
          AppSpace.verticalL!,
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.primary,
            radius: 32,
            child: Icon(
              Icons.done,
              size: 32,
              color: Theme.of(context).colorScheme.background,
            )
          )
        ],
      ),
    );
  }
}
