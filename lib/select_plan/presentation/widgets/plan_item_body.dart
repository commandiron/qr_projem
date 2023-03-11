import 'dart:ui';

import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_padding.dart';
import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class PlanItemBody extends StatelessWidget {
  const PlanItemBody({Key? key, required this.isImageBlurred, required this.features}) : super(key: key);

  final bool isImageBlurred;
  final List<String> features;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSpace.horizontalExpanded!,
        Expanded(
          flex: 12,
          child: ImageFiltered(
              imageFilter: ImageFilter.blur(sigmaX: isImageBlurred ? 10 : 0, sigmaY: isImageBlurred ? 10 : 0),
              child: Image.asset("assets/images/virtual_showroom/virtual_showroom_ss_360.png")
          ),
        ),
        AppSpace.horizontalExpanded!,
        Expanded(
          flex: 12,
          child: Column(
            children: [
              Expanded(
                  child: Text("Özellikler", style: AppTextStyle.b1b,)
              ),
              Expanded(
                flex: 11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: features.map(
                    (feature) => Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary
                        ),
                        padding: AppPadding.horizontalS!,
                        width: double.infinity,
                        alignment: Alignment.centerLeft,
                        child: FittedBox(
                          fit: BoxFit.scaleDown,
                          child: Row(
                            children: [
                              Icon(Icons.check, color: Theme.of(context).colorScheme.primary,),
                              AppSpace.horizontalM!,
                              Text(feature, style: AppTextStyle.b2b,),
                            ],
                          ),
                        ),
                      ),
                    )
                  ).toList(),
                ),
              )
            ],
          )
        ),
        AppSpace.horizontalExpanded!,
      ],
    );
  }
}
