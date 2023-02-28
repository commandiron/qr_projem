import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

class HowTo extends StatelessWidget {
  const HowTo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 768,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Qr Projem Nasıl Çalışır?", style: AppTextStyle.h2,),
        ],
      ),
    );
  }
}
