import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/payment_and_qr_cubit.dart';
import '../domain/payment_and_qr_state.dart';

class PaymentAndQrBody extends StatelessWidget {
  const PaymentAndQrBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PaymentAndQrCubit, PaymentAndQrState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Text("Here"),
                  Footer(),
                  CopyrightFooter()
                ]
              ),
            )
          ],
        );
      },
    );
  }
}