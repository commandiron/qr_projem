import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import 'package:qr_projem/auth/presentation/sections/sign_in.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';
import 'package:qr_projem/auth/presentation/sections/verification.dart';
import 'package:qr_projem/auth/presentation/widget/auth_base.dart';

import '../domain/cubit/auth_cubit.dart';
import '../domain/cubit/auth_state.dart';

class AuthBody extends StatelessWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (blocContext, state) {
        if(state.authPageState == AuthPageState.error) {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Text(state.snackBarErrorMessage),
            ),
          );
        }
      },
      builder: (context, state) {
        return PageView.builder(
          controller: state.pageController,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            if(state.authPageState == AuthPageState.loading) {
              return const AuthBase(child: Center(child: CircularProgressIndicator()));
            }
            return sections[index];
          },
        );
      },
    );
  }
}

const sections = [
  SignUp(),
  Verification(),
  Done(),
  SignIn(),
];