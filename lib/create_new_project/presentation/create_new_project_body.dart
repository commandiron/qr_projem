import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/loading_container.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_cubit.dart';
import 'package:qr_projem/create_new_project/domain/create_new_project_state.dart';
import 'package:qr_projem/create_new_project/presentation/create_new_steps.dart';

import '../../core/presentation/helper/ui_state.dart';
import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../../select_plan/presentation/select_plan_screen.dart';

class CreateNewProjectBody extends StatelessWidget {
  const CreateNewProjectBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CreateNewProjectCubit, CreateNewProjectState>(
      listener: (context, state) {
        if(state.uiState is UiSuccess) {
          Navigator.of(context).pushNamed(SelectPlanScreen.route, arguments: state.projectEntry.id);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          controller: state.scrollController,
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  if(state.uiState is UiLoading)
                    const LoadingContainer(
                      text: "İşlem 1 dakika kadar sürebilir. Lütfen bekleyiniz.",
                    ),
                  if(state.uiState is UiInitial)
                    const CreateNewSteps(),
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