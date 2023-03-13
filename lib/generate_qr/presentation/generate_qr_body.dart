import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
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
        print(state.uiState);
        if(state.uiState is UiError) {
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
                    if(state.uiState is UiLoading)
                      Container(
                        height: 768,
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                    if(state.uiState is UiSuccess)
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