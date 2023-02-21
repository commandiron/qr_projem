import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/widgets/nav_bar/nav_bar.dart';
import '../domain/cubit/auth_cubit.dart';
import 'auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const route = "/auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(),
      child: Scaffold(
          body: Stack(
            children: const [
              AuthBody(),
              NavBar(),
            ],
          )
      ),
    );
  }
}
