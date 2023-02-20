import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/home/presentation/sections/welcome.dart';
import 'package:qr_projem/home/presentation/sections/how_to.dart';

import '../domain/cubit/home_cubit.dart';
import '../domain/cubit/home_state.dart';
import 'sections/footer.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: state.scrollController,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {
              PointerDeviceKind.mouse,
              PointerDeviceKind.trackpad,
              PointerDeviceKind.touch
            },
          ),
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: sections
              ),
            )
          ],
        );
      },
    );
  }
}

const sections = [
  Welcome(),
  HowTo(),
  Footer(),
];
