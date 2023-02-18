import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/domain/cubit/auth_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';

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
        extendBody: false,
        body: BlocBuilder<AuthCubit, AuthState>(
          builder: (context, state) {
            return PageView(
              controller: state.authPageController,
              children: [
                Container(
                  child: Column(
                    children: [
                      Text("Welcome Page"),
                      ElevatedButton(
                        onPressed: () {
                          state.authPageController.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.bounceInOut
                          );
                        },
                        child: Text("Next Page")
                      )
                    ],
                  ),
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Auth Page"),
                      AppSpace.verticalL!,
                      SizedBox(
                          width: 400,
                          child: TextField(
                            inputFormatters: [
                              state.phoneFormatter
                            ],
                          )
                      ),
                      AppSpace.verticalL!,
                      ElevatedButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .singInWithPhoneNumber();
                          },
                          child: Text("Sign In")
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        )
    );
  }
}



