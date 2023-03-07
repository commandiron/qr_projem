import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../../../core/presentation/config/app_padding.dart';

class AddImageBoxButton extends StatelessWidget {
  const AddImageBoxButton(
      {required this.onTap, this.padding, this.child, this.showError = false, Key? key}) : super(key: key);

  final void Function() onTap;
  final EdgeInsetsGeometry? padding;
  final Widget? child;
  final bool showError;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: showError ? Theme.of(context).colorScheme.error : Colors.black
            )
          ),
          alignment: Alignment.center,
          padding: padding ?? AppPadding.allS,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: FittedBox(
                    child: child ?? Icon(
                      Icons.add_photo_alternate_outlined,
                      size: 100,
                      color: showError ? Theme.of(context).colorScheme.error : Colors.black,
                    )
                ),
              ),
              if(showError)
                FittedBox(child: Text("Lütfen seçiniz", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.error),))
            ],
          ),
        ),
      ),
    );
  }
}
