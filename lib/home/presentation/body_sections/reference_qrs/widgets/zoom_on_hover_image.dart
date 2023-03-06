import 'package:flutter/material.dart';

import '../../../../../core/presentation/config/app_padding.dart';

class ZoomOnHoverImage extends StatelessWidget {
  const ZoomOnHoverImage({required this.imageAsset, Key? key}) : super(key: key);

  final String imageAsset;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: AppPadding.allS,
      child: InteractiveViewer(child: Image.asset(imageAsset, fit: BoxFit.cover,))
    );
  }
}
