import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:qr_projem/auth/domain/cubit/auth_cubit.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  static const pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          VerificationCode(
            fullBorder: true,
            fillColor: Colors.white,
            length: 6,
            onCompleted: (value) {
              BlocProvider.of<AuthCubit>(context, listen: false).singInVerification(value);
            },
            onEditing: (value) {

            },
          ),
        ],
      )
    );
  }
}
