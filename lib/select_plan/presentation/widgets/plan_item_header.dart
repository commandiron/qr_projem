import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class PlanItemHeader extends StatelessWidget {
  const PlanItemHeader({Key? key, required this.title, required this.price, required this.isPriceUnitVisible}) : super(key: key);

  final String title;
  final String price;
  final bool isPriceUnitVisible;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AppSpace.verticalExpanded!,
        Expanded(
          flex: 3,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              title,
              style: AppTextStyle.b1b,
              textAlign: TextAlign.center,
            ),
          ),
        ),
        AppSpace.verticalExpanded!,
        Expanded(
          flex: 6,
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  price,
                  style: AppTextStyle.h2b!.copyWith(color: Theme.of(context).colorScheme.primary),
                  textAlign: TextAlign.center,
                ),
                if(isPriceUnitVisible)
                  Text(
                    " / proje",
                    style: AppTextStyle.b2!.copyWith(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
              ],
            ),
          ),
        ),
        AppSpace.verticalExpanded!,
        Expanded(
          flex: 2,
          child: Padding(
              padding: AppPadding.horizontalL!,
              child: Divider()
          ),
        ),
        AppSpace.verticalExpanded!,
      ],
    );
  }
}
