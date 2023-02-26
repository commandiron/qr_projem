import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_verification_code/flutter_verification_code.dart';
import 'package:qr_projem/auth/domain/cubit/auth_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

import '../widget/auth_base.dart';

class Verification extends StatelessWidget {
  const Verification({Key? key}) : super(key: key);

  static const pageIndex = 1;

  @override
  Widget build(BuildContext context) {
    return AuthBase(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Lütfen telefonunuza gelen kodu giriniz", style: AppTextStyle.h4,),
          AppSpace.verticalXL!,
          VerificationCode(
            fullBorder: true,
            fillColor: Colors.white,
            underlineColor: Theme.of(context).colorScheme.primary,
            length: 6,
            onCompleted: (value) {
              BlocProvider.of<AuthCubit>(context, listen: false).singInVerification(value);
            },
            onEditing: (value) {},
          ),
        ],
      )
    );
  }
}
