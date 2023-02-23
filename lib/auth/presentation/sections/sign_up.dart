import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/admin/presentation/admin_screen.dart';
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
          Text("Kayıt Ol", style: AppTextStyle.h2!,),
          AppSpace.verticalL!,
          SizedBox(
            width: 400,
            child: BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return TextField(
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
            child: Text("Sign In")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AdminScreen.route);
              },
              child: Text("To Admin Page")
          ),
        ],
      ),
    );
  }
}
