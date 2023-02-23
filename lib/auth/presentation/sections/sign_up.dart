import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../domain/cubit/auth_cubit.dart';
import '../../domain/cubit/auth_state.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AppSpace.verticalXXXL!,
          Text("Kayıt Ol", style: AppTextStyle.h1!,),
          AppSpace.verticalXXXL!,
          SizedBox(
            width: 400,
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
