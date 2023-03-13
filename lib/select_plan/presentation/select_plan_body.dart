import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/helper/ui_state.dart';
import 'package:qr_projem/select_plan/presentation/plan_options.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../../generate_qr/presentation/generate_qr_screen.dart';
import '../../home/presentation/home_screen.dart';
import '../domain/select_plan_cubit.dart';
import '../domain/select_plan_state.dart';

class SelectPlanBody extends StatelessWidget {
  const SelectPlanBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectPlanCubit, SelectPlanState>(
      listener: (context, state) {
        if(state.uiState is UiError) {
          Navigator.of(context).pushNamed(HomeScreen.route);
        }
        if(state.uiState is UiSuccess) {
          Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: state.projectId);
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
                  PlanOptions(projectId: state.projectId,),
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