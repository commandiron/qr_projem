import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/generate_qr/domain/generate_qr_cubit.dart';
import 'package:qr_projem/generate_qr/domain/generate_qr_state.dart';
import 'package:qr_projem/home/presentation/home_screen.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import 'generate_qr_view.dart';

class GenerateQrBody extends StatelessWidget {
  const GenerateQrBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<GenerateQrCubit, GenerateQrState>(
      listener: (context, state) {
        if(state.userId == null || state.projectId == null) {
          Navigator.of(context).pushNamed(HomeScreen.route);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  children: [
                    if(state.qrImage != null && state.paymentStatus != null)
                      GenerateQrView(
                        qrImage: state.qrImage!,
                        paymentStatus: state.paymentStatus!,
                      ),
                    const Footer(),
                    const CopyrightFooter()
                  ]
              ),
            )
          ],
        );
      },
    );
  }
}