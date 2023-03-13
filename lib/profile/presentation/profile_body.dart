import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/profile/presentation/widgets/my_projects.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/cubit/profile_cubit.dart';
import '../domain/cubit/profile_state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
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
                    MyProjects(projects: state.projects),
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