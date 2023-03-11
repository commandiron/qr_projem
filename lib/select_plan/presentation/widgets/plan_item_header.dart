import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class PlanItemHeader extends StatelessWidget {
  const PlanItemHeader({Key? key, required this.title, required this.price, this.discountedPrice, required this.isPriceUnitVisible}) : super(key: key);

  final String title;
  final String price;
  final String? discountedPrice;
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
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: price,
                        style: AppTextStyle.h3!.copyWith(
                          color: discountedPrice != null ? Colors.grey : Theme.of(context).colorScheme.primary,
                          decoration: discountedPrice != null ? TextDecoration.lineThrough : TextDecoration.none,
                        )
                      ),
                      const WidgetSpan(child: SizedBox(width: 8,)),
                      if(discountedPrice != null)
                        TextSpan(
                          text: discountedPrice,
                          style: AppTextStyle.h3!.copyWith(
                              color: Theme.of(context).colorScheme.primary
                          )
                        ),
                    ]
                  )
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
