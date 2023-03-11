import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class PlanOptionsHeader extends StatelessWidget {
  const PlanOptionsHeader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Plan Seçiniz", style: AppTextStyle.h2!,),
        AppSpace.verticalM!,
        Text(
          "QR kodunuzu oluşturmadan önce plan seçmeniz gerekmektedir. Ödemeyi daha sonra yapabilirsiniz.",
          style: AppTextStyle.b1!.copyWith(color: Colors.grey),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
