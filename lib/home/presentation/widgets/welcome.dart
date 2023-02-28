import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/auth_screen.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../../../profile/presentation/profile_screen.dart';

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
          Image.asset("assets/images/qr/qr-code.png"),
          AppSpace.verticalXL!,
          Text("İnşaat projeleri için proje tanıtımının kolay yolu.", style: AppTextStyle.h3!.copyWith(
            fontStyle: FontStyle.italic,
            color: Colors.white
          ),),
          AppSpace.verticalXL!,
          Text("Hemen proje bilgilerinizi girin ve Qr kodunuzu oluşturun", style: AppTextStyle.h1!.copyWith(color: Colors.white),),
          AppSpace.verticalXL!,
          ElevatedButton(
            style: ButtonStyle(
              padding: MaterialStateProperty.all(
                AppPadding.horizontalL!.add(AppPadding.verticalM!)
              )
            ),
            onPressed: () {
              if(BlocProvider.of<CoreCubit>(context).state.isUserAuthenticated) {
                Navigator.of(context).pushNamed(ProfileScreen.route);
              } else {
                Navigator.of(context).pushNamed(AuthScreen.route);
              }
            },
            child: Text("Hemen Başla", style: AppTextStyle.h3,)
          )
        ],
      ),
    );
  }
}
