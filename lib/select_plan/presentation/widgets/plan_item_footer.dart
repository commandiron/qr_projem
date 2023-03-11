import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_text_style.dart';

class PlanItemFooter extends StatelessWidget {
  const PlanItemFooter({required this.footerText, required this.onPressed, Key? key,}) : super(key: key);

  final String footerText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(32),
              bottomRight: Radius.circular(32)
          )
      ),
      color: Theme.of(context).colorScheme.primary,
      margin: EdgeInsets.zero,
      child: Container(
        width: double.infinity,
        alignment: Alignment.center,
        padding: AppPadding.horizontalL!,
        child: ElevatedButton(
          style: ButtonStyle(
              backgroundColor: const MaterialStatePropertyAll(Colors.white),
              padding: MaterialStatePropertyAll(AppPadding.allS!)
          ),
          onPressed: onPressed,
          child: Padding(
            padding: AppPadding.allS!,
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: Text(
                footerText,
                style: AppTextStyle.h3!.copyWith(color: Theme.of(context).colorScheme.primary)
              )
            ),
          )
        ),
      ),
    );
  }
}
