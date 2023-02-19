import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/authentication/presentation/pages/current_page.dart';

import '../domain/cubit/authentication_cubit.dart';
import '../domain/cubit/authentication_state.dart';

class AuthenticationScreen extends StatelessWidget {
  const AuthenticationScreen({Key? key}) : super(key: key);

  static const route = "/authentication";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthenticationCubit>(
        create: (context) => AuthenticationCubit(),
        child: const AuthenticationChild()
    );
  }
}

class AuthenticationChild extends StatelessWidget {
  const AuthenticationChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<AuthenticationCubit, AuthenticationState>(
        builder: (context, state) {
          return Column(
            children: [
              CurrentPage(
                pages: state.pages,
                pageIndex: state.pageIndex
              ),
            ],
          );
        },
      )
    );
  }
}