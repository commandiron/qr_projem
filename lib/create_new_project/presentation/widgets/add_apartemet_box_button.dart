import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../../../core/presentation/config/app_padding.dart';

class AddApartmentBoxButton extends StatelessWidget {
  const AddApartmentBoxButton({required this.onTap, this.padding, this.child, Key? key}) : super(key: key);

  final void Function() onTap;
  final EdgeInsetsGeometry? padding;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AspectRatio(
        aspectRatio: 1,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          alignment: Alignment.center,
          padding: padding ?? AppPadding.allS,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FittedBox(child: child ?? const Icon(Icons.add, size: 100)),
              Text("Daire ekle", style: AppTextStyle.h2,)

            ],
          ),
        ),
      ),
    );
  }
}
