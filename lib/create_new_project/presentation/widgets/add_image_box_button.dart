import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';

class AddImageBoxButton extends StatelessWidget {
  const AddImageBoxButton({required this.onTap, this.child, Key? key}) : super(key: key);

  final void Function() onTap;
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
          padding: AppPadding.allS,
          child: FittedBox(child: child ?? const Icon(Icons.add_photo_alternate_outlined, size: 100)),
        ),
      ),
    );
  }
}
