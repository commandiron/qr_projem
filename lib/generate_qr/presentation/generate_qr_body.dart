import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/generate_qr_cubit.dart';
import '../domain/generate_qr_state.dart';

class GenerateQrBody extends StatelessWidget {
  const GenerateQrBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GenerateQrCubit, GenerateQrState>(
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
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