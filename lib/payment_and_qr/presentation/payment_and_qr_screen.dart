import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/payment_and_qr/presentation/payment_and_qr_body.dart';

import '../../core/presentation/widgets/app_bar/custom_app_bar.dart';
import '../../core/presentation/widgets/floating_buttons/floating_buttons.dart';
import '../domain/payment_and_qr_cubit.dart';

class PaymentAndQrScreen extends StatelessWidget {
  const PaymentAndQrScreen({Key? key}) : super(key: key);

  static const route = "/payment_and_qr";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<PaymentAndQrCubit>(
      create: (context) => PaymentAndQrCubit(),
      child: const Scaffold(
          appBar: CustomAppBar(),
          floatingActionButton: FloatingButtons(),
          body: PaymentAndQrBody()
      ),
    );
  }
}
