import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/home/presentation/body_sections/reference_qrs/widgets/zoom_on_hover_image.dart';

class ReferenceQrs extends StatelessWidget {
  const ReferenceQrs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 768,
      color: Colors.black,
      padding: AppPadding.verticalS!,
      child: Row(
        children: [
          Expanded(
            flex:2,
            child: Column(
              children: const [
                Expanded(
                  child: ZoomOnHoverImage(imageAsset: "assets/images/reference_qrs/custom_design.png")
                ),
                Expanded(
                  child: ZoomOnHoverImage(imageAsset: "assets/images/reference_qrs/Screenshot_2.png")
                ),
              ],
            )
          ),
          const Expanded(
            child: ZoomOnHoverImage(imageAsset: "assets/images/reference_qrs/Screenshot_3.png")
          )
        ],
      )
    );
  }
}
