import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import '../../domain/cubit/auth_cubit.dart';
import '../../domain/cubit/auth_state.dart';
import '../widget/auth_base.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const pageIndex = 3;

  @override
  Widget build(BuildContext context) {
    return AuthBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Giriş Yap", style: AppTextStyle.h2!,),
          AppSpace.verticalL!,
          Text("Hoşgeldiniz", style: AppTextStyle.h3!,),
          AppSpace.verticalL!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Hesabım yok.", style: AppTextStyle.h4!.copyWith(color: Colors.grey),),
              TextButton(
                child: Text("Kayıt ol",
                  style: AppTextStyle.h4!.copyWith(color: Theme.of(context).colorScheme.primary),
                ),
                onPressed: () {
                  BlocProvider.of<AuthCubit>(context, listen: false).jumpToPage(SignUp.pageIndex);
                },
              )
            ],
          ),
          AppSpace.verticalXL!,
          SizedBox(
            width: 360,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return TextField(
                  controller: state.textEditingController,
                  decoration: InputDecoration(
                      hintText: "+90 (XXX) XXX-XX-XX",
                      errorText: state.textFieldErrorMessage
                  ),
                  inputFormatters: [
                    state.phoneFormatter
                  ],
                );
              },
            )
          ),
          AppSpace.verticalL!,
          ElevatedButton(
            onPressed: () {
              BlocProvider.of<AuthCubit>(context, listen: false).singInWithPhoneNumber();
            },
            child: Text("Devam et")
          ),
        ],
      ),
    );
  }
}
