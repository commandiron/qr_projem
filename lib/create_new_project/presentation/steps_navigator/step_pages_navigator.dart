import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/create_new_project/presentation/steps_navigator/navigator_item.dart';

import '../../domain/create_new_project_state.dart';

class StepPagesNavigator extends StatelessWidget {
  const StepPagesNavigator({required this.items, required this.selectedIndex, Key? key}) : super(key: key);

  final List<StepPage> items;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        )
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            children: items.map(
              (item) {
                return Expanded(
                  child: Padding(
                    padding: AppPadding.allS!,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      child: NavigatorItem(
                        selectedIndex: selectedIndex,
                        itemIndex: item.index,
                        itemTitle: item.title
                      )
                    ),
                  ),
                );
              }
            ).toList()
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            mainAxisSize: MainAxisSize.max,
            children: [
              for (var i = 0; i < items.length - 1; i++)
                Icon(
                  Icons.arrow_right_alt,
                  color: Theme.of(context).colorScheme.onPrimary,
                ),
            ]
          )
        ],
      ),
    );
  }
}
