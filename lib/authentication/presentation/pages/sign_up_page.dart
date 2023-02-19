import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/config/app_space.dart';
import '../../domain/cubit/authentication_cubit.dart';
import '../../domain/cubit/authentication_state.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({Key? key}) : super(key: key);

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
            child: BlocBuilder<AuthenticationCubit, AuthenticationState>(
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
              BlocProvider.of<AuthenticationCubit>(context, listen: false)
                .singInWithPhoneNumber();
            },
            child: Text("Sign In")
          ),
        ],
      ),
    );
  }
}
