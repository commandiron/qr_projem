import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';
import 'package:qr_projem/core/presentation/helper/url_launcher.dart';

class CopyrightFooter extends StatelessWidget {
  const CopyrightFooter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      color: Colors.grey.shade900,
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: AppPadding.horizontalXXL!,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text("© 2023 by Demirli Tech", style: AppTextStyle.b1!.copyWith(color: Colors.grey),),
            InkWell(
              onTap: () {
                openURL("https://www.demirli.tech");
              },
              child: Image.asset(
                "assets/images/logo/demirli_tech_text_logo.png",
                height: 16,
              )
            )
          ],
        ),
      ),
    );
  }
}
