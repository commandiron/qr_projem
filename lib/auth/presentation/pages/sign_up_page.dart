import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/presentation/config/app_space.dart';
import '../../domain/cubit/auth_cubit.dart';
import '../../domain/cubit/auth_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

  static const pageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Auth Page"),
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
        ],
      ),
    );
  }
}
