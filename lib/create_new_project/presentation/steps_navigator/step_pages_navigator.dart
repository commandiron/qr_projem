import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../../domain/create_new_project_state.dart';

class StepPagesNavigator extends StatelessWidget {
  const StepPagesNavigator({required this.items, Key? key}) : super(key: key);

  final List<StepPage> items;

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
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: items.map(
          (item) {
            return Row(
              children: [
                Text(
                  item.title,
                  style: AppTextStyle.h3!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary
                  ),
                ),
                if (item.isDone)
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
                  )
              ],
            );
          }
        ).toList()
      ),
    );
  }
}
