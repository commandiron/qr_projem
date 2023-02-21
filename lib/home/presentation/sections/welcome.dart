import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 768,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/qr_projem_cover.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
              Colors.black.withOpacity(0.5), BlendMode.srcATop
          )
        )
      ),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("İnşaat projeleri için proje tanıtımının kolay yolu.", style: AppTextStyle.h3!.copyWith(
            fontStyle: FontStyle.italic
          ),),
          AppSpace.verticalXL!,
          Text("Hemen proje bilgilerinizi girin ve Qr kodunuzu oluşturun", style: AppTextStyle.h1,),
          AppSpace.verticalXL!,
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                AppPadding.horizontalL!.add(AppPadding.verticalM!)
              )
            ),
            onPressed: () {},
            child: Text("Hemen Başla", style: AppTextStyle.h3,)
          )
        ],
      ),
    );
  }
}
