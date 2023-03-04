import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/sign_up.dart';
import 'package:qr_projem/auth/presentation/widget/sign_in_up_base.dart';
import '../../domain/cubit/auth_cubit.dart';

class SignIn extends StatelessWidget {
  const SignIn({Key? key}) : super(key: key);

  static const pageIndex = 3;

  @override
  Widget build(BuildContext context) {
    return SignInUpBase(
      title: "Giriş Yap",
      subTitle: "Hoşgeldiniz",
      textButtonTitle: "Hesabım yok.",
      textButtonText: "Kayıt ol",
      onTextButtonPressed: () => BlocProvider.of<AuthCubit>(context, listen: false).delayedJumpToPage(SignUp.pageIndex),
    );
  }
}
