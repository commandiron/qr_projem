import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_body.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_footer.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_header.dart';

class PlanItem extends StatelessWidget {
  const PlanItem(
    {
      required this.title,
      required this.price,
      this.isPriceUnitVisible = false,
      required this.footerText,
      this.isImageBlurred = false,
      required this.features,
      required this.onPressed,
      Key? key
    }
  ) : super(key: key);

  final String title;
  final String price;
  final bool isPriceUnitVisible;
  final String footerText;
  final bool isImageBlurred;
  final List<String> features;
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
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: PlanItemHeader(
              title: title,
              price: price,
              isPriceUnitVisible: isPriceUnitVisible
            )
          ),
          AppSpace.verticalExpanded!,
          Expanded(
            flex: 24,
            child: PlanItemBody(
              isImageBlurred: isImageBlurred,
              features: features
            )
          ),
          AppSpace.verticalExpanded!,
          Expanded(
            flex: 4,
            child: PlanItemFooter(
              footerText: footerText,
              onPressed: onPressed,
            )
          )
        ],
      ),
    );
  }
}
