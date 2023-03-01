import 'package:flutter/material.dart';

import '../../../config/app_text_style.dart';

class FooterTitle extends StatelessWidget {
  const FooterTitle({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: AppTextStyle.h3!.copyWith(
        color:  Theme.of(context).colorScheme.onSecondaryContainer
      ),
    );
  }
}
