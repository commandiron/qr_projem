import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';
import '../domain/cubit/auth_cubit.dart';
import 'auth_body.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const route = "/auth";

  @override
  Widget build(BuildContext context) {

    final initialPage = ModalRoute.of(context)!.settings.arguments as int?;

    return BlocProvider<AuthCubit>(
      create: (context) => AuthCubit(initialPage),
      child: const Scaffold(
        appBar: CustomAppBar(),
        body: AuthBody(),
      ),
    );
  }
}
