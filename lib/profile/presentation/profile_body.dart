import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/profile/presentation/widgets/control_panel.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../cubit/profile_cubit.dart';
import '../cubit/profile_state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return CustomScrollView(
          controller: state.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: const [
                  ControlPanel(),
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