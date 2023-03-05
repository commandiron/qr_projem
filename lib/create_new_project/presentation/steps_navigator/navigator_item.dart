import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_text_style.dart';

class NavigatorItem extends StatelessWidget {
  const NavigatorItem(
    {
      required this.selectedIndex,
      required this.itemIndex,
      required this.itemTitle,
      Key? key
    }
  ) : super(key: key);

  final int selectedIndex;
  final int itemIndex;
  final String itemTitle;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: selectedIndex == itemIndex
        ? Theme.of(context).colorScheme.onPrimary
        : Theme.of(context).colorScheme.primary,
      elevation: selectedIndex == itemIndex
        ? null
        : 0,
      child: Padding(
        padding: AppPadding.verticalS!.add(AppPadding.horizontalM!),
        child: Row(
          children: [
            AppSpace.horizontalL!,
            Text(
              itemTitle,
              style: AppTextStyle.h3!.copyWith(
                color: selectedIndex == itemIndex
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.onPrimary,
              )
            ),
            if (selectedIndex > itemIndex)
              Row(
                children: [
                  AppSpace.horizontalM!,
                  Card(
                    color: const Color(0xff14B311),
                    margin: EdgeInsets.zero,
                    child: Icon(
                      Icons.done,
                      size: 24,
                      color: Theme.of(context).colorScheme.background,
                    )
                  )
                ],
              ),
            AppSpace.horizontalL!,
          ],
        ),
      ),
    );
  }
}
