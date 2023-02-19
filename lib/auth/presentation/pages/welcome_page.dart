import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/domain/cubit/auth_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Qr Projem", style: AppTextStyle.h1,),
          AppSpace.verticalL!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Kayıt Ol", style: AppTextStyle.h1,),
              AppSpace.horizontalL!,
              Text("Zaten Üyeyim", style: AppTextStyle.h1,),
            ],
          ),
          AppSpace.verticalL!,
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context, listen: false).jumpToPage(1);
            },
            child: Text("Next Page")
          )
        ],
      ),
    );
  }
}
