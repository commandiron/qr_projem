import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/domain/cubit/auth_cubit.dart';
import 'package:qr_projem/auth/presentation/pages/current_page.dart';
import '../domain/cubit/auth_state.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const route = "/auth";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AuthCubit>(
        create: (context) => AuthCubit(),
        child: const AuthChild()
    );
  }
}

class AuthChild extends StatelessWidget {
  const AuthChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: BlocBuilder<AuthCubit, AuthState>(
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