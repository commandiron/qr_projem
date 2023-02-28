import 'package:flutter/material.dart';

import '../config/app_padding.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      color: Theme.of(context).colorScheme.primaryContainer,
      padding: AppPadding.horizontalXXXL!,
      alignment: Alignment.centerLeft,
      child: Image.asset("assets/images/logo/qr_projem_logo_with_text_black_white.png"),
    );
  }
}
