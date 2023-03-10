import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

class PlanItem extends StatelessWidget {
  const PlanItem({required this.title, required this.footerText, required this.onPressed, Key? key}) : super(key: key);

  final String title;
  final String footerText;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32)
        )
      ),
      child: Column(
        children: [
          Expanded(
            flex: 5,
            child: Text(title, style: AppTextStyle.h3,)
          ),
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
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
                child: ElevatedButton(
                  style: ButtonStyle(
                    backgroundColor: MaterialStatePropertyAll(Colors.white),
                  ),
                  onPressed: onPressed,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(footerText, style: AppTextStyle.h3!.copyWith(color: Theme.of(context).colorScheme.primary)),
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
