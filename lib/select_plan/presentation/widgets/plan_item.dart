import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

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
            flex: 6,
            child: Padding(
              padding: AppPadding.horizontalM!,
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AppSpace.verticalExpanded!,
                        Expanded(
                          flex: 3,
                          child: Text(
                            title,
                            style: AppTextStyle.b1b,
                            textAlign: TextAlign.center,
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
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 12,
                          child: ImageFiltered(
                            imageFilter: ImageFilter.blur(sigmaX: isImageBlurred ? 10 : 0, sigmaY: isImageBlurred ? 10 : 0),
                            child: Image.asset("assets/images/virtual_showroom/virtual_showroom_ss.png")
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
                        )
                      ],
                    )
                  ),
                  AppSpace.verticalExpanded!,
                ],
              ),
            )
          ),
          Expanded(
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(32),
                  bottomRight: Radius.circular(32)
                )
              ),
              color: Theme.of(context).colorScheme.primary,
              margin: EdgeInsets.zero,
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                padding: AppPadding.horizontalL!,
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: const MaterialStatePropertyAll(Colors.white),
                    padding: MaterialStatePropertyAll(AppPadding.allS!)
                  ),
                  onPressed: onPressed,
                  child: Padding(
                    padding: AppPadding.allS!,
                    child: FittedBox(fit: BoxFit.scaleDown, child: Text(footerText, style: AppTextStyle.h3!.copyWith(color: Theme.of(context).colorScheme.primary))),
                  )
                ),
              ),
            )
          )
        ],
      ),
    );
  }
}
