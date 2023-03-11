import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_body.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_footer.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item_header.dart';

class PlanItem extends StatefulWidget {
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
  State<PlanItem> createState() => _PlanItemState();
}

class _PlanItemState extends State<PlanItem> {

  double _opacity = 0.2;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          if(value) {
            _opacity = 0.0;
          } else {
            _opacity = 0.2;
          }
        });
      },
      onTap: widget.onPressed,
      overlayColor: MaterialStatePropertyAll(Theme.of(context).colorScheme.primary),
      customBorder: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32)
        )
      ),
      child: ImageFiltered(
        imageFilter: ColorFilter.mode(
          Theme.of(context).colorScheme.primaryContainer.withOpacity(_opacity),
          BlendMode.srcATop
        ),
        child: Card(
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
                  title: widget.title,
                  price: widget.price,
                  isPriceUnitVisible: widget.isPriceUnitVisible
                )
              ),
              AppSpace.verticalExpanded!,
              Expanded(
                flex: 24,
                child: PlanItemBody(
                  isImageBlurred: widget.isImageBlurred,
                  features: widget.features
                )
              ),
              AppSpace.verticalExpanded!,
              Expanded(
                flex: 4,
                child: PlanItemFooter(
                  footerText: widget.footerText,
                  onPressed: widget.onPressed,
                )
              )
            ],
          ),
        ),
      ),
    );
  }
}
