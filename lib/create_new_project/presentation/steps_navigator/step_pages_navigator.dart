import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

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
      child: Row(
        children: items.map(
          (item) {
            return Expanded(
              child: Padding(
                padding: AppPadding.allS!,
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Row(
                    children: [
                      AppSpace.horizontalL!,
                      Text(
                        item.title,
                        style: AppTextStyle.h3!.copyWith(
                          color: Theme.of(context).colorScheme.onPrimary
                        ),
                      ),
                      if (selectedIndex > item.index)
                        Row(
                          children: [
                            AppSpace.horizontalM!,
                            Card(
                              color: const Color(0xff14B311),
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
              ),
            );
          }
        ).toList()
      ),
    );
  }
}
