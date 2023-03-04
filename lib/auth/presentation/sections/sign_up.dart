import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/sections/sign_in.dart';

import '../../domain/cubit/auth_cubit.dart';
import '../widget/sign_in_up_base.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  static const pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SignInUpBase(
      title: "Kayıt Ol",
      subTitle: "Hesap Oluştur",
      textButtonTitle: "Zaten hesabım var.",
      textButtonText: "Giriş yap",
      onTextButtonPressed: () => BlocProvider.of<AuthCubit>(context, listen: false).delayedJumpToPage(SignIn.pageIndex)
    );
  }
}
