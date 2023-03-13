import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/core/presentation/widgets/loading_container.dart';
import 'package:qr_projem/profile/presentation/widgets/my_projects.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/cubit/profile_cubit.dart';
import '../domain/cubit/profile_state.dart';

class ProfileBody extends StatelessWidget {
  const ProfileBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if(state is UiError) {
          showDialog(
            context: context,
            builder: (dialogContext) {
              return const AlertDialog(content: Text("Bir hata oluştu."),);
            },
          );
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
                    const LoadingContainer(),
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