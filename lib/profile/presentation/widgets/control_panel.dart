import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class ControlPanel extends StatelessWidget {
  const ControlPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 768,
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
          children: [
            AppSpace.horizontalExpanded!,
            Expanded(
              flex: 6,
              child: Padding(
                padding: AppPadding.verticalL!,
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                          Radius.circular(32)
                      )
                  ),
                  child: Row(
                    children: [
                      Expanded(
                          flex: 1,
                          child: Card(
                            color: Theme.of(context).colorScheme.primary,
                            margin: EdgeInsets.zero,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(32),
                                  bottomLeft: Radius.circular(32),
                                )
                            ),
                            child: Padding(
                              padding: AppPadding.verticalL!.add(AppPadding.horizontalS!),
                              child: Column(
                                children: [
                                  Text("Kontrol Paneli", style: AppTextStyle.h3,)
                                ],
                              ),
                            ),
                          )
                      ),
                      Expanded(
                          flex: 3,
                          child: Container()
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AppSpace.horizontalExpanded!,
          ],
        )
    );
  }
}
