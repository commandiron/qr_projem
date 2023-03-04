import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/widget/auth_base.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import '../../../core/presentation/helper/phone_input_mask.dart';
import '../../domain/cubit/auth_cubit.dart';
import '../../domain/cubit/auth_state.dart';

class SignInUpBase extends StatelessWidget {
  const SignInUpBase(
    {
      Key? key,
      required this.title,
      required this.subTitle,
      required this.textButtonTitle,
      required this.textButtonText,
      required this.onTextButtonPressed
    }
  ) : super(key: key);

  final String title;
  final String subTitle;
  final String textButtonTitle;
  final String textButtonText;
  final void Function() onTextButtonPressed;


  @override
  Widget build(BuildContext context) {
    return AuthBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title, style: AppTextStyle.h2!,),
          AppSpace.verticalL!,
          Text(subTitle, style: AppTextStyle.h3!,),
          AppSpace.verticalL!,
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(textButtonTitle, style: AppTextStyle.h4!.copyWith(color: Colors.grey),),
              TextButton(
                onPressed: onTextButtonPressed,
                child: Text(
                  textButtonText,
                  style: AppTextStyle.h4!.copyWith(color: Theme.of(context).colorScheme.primary),
                )
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
                      hintText: "+90 (XXX) XXX XX XX",
                      errorText: state.textFieldErrorMessage
                    ),
                    inputFormatters: [
                      PhoneInputMask.mask
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
