import 'package:flutter/material.dart';

import '../../../config/app_text_style.dart';

class FooterTextButton extends StatelessWidget {
  const FooterTextButton({required this.label, this.onPressed, Key? key}) : super(key: key);

  final String label;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: ButtonStyle(
          foregroundColor: MaterialStateProperty.resolveWith<Color?>(
                (states) {
              if (states.contains(MaterialState.hovered)) {
                return Theme.of(context).colorScheme.primary;
              }
              return Theme.of(context).colorScheme.onPrimary;
            },
          ),
          overlayColor: MaterialStateProperty.all(Colors.transparent)
      ),
      child: Text(
        label,
        style: AppTextStyle.b2!
      )
    );
  }
}
