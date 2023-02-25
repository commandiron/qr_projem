import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/done.dart';
import 'package:qr_projem/auth/presentation/sections/sign_in.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';
import 'package:qr_projem/auth/presentation/sections/verification.dart';

import '../domain/cubit/auth_cubit.dart';
import '../domain/cubit/auth_state.dart';

class AuthBody extends StatefulWidget {
  const AuthBody({Key? key}) : super(key: key);

  @override
  State<AuthBody> createState() => _AuthBodyState();
}

class _AuthBodyState extends State<AuthBody> {

  @override
  void initState() {
    BlocProvider.of<AuthCubit>(context, listen: false).getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        return PageView.builder(
          controller: state.pageController,
          itemCount: sections.length,
          itemBuilder: (context, index) {
            if(state.isLoading) {
              return const Center(child: CircularProgressIndicator());
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