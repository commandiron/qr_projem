import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/copyright_footer.dart';
import 'package:qr_projem/home/presentation/widgets/welcome.dart';
import 'package:qr_projem/home/presentation/widgets/how_to.dart';

import '../domain/cubit/home_cubit.dart';
import '../domain/cubit/home_state.dart';
import '../../core/presentation/widgets/footer/footer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: state.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  Welcome(),
                  HowTo(),
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
