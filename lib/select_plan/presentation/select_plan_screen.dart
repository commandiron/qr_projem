import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/select_plan/presentation/select_plan_body.dart';

import '../../core/presentation/widgets/app_bar/custom_app_bar.dart';
import '../../core/presentation/widgets/floating_buttons/floating_buttons.dart';
import '../domain/select_plan_cubit.dart';

class SelectPlanScreen extends StatelessWidget {
  const SelectPlanScreen({Key? key}) : super(key: key);

  static const route = "/select_plan";

  @override
  Widget build(BuildContext context) {

    final projectId = ModalRoute
        .of(context)!
        .settings
        .arguments as String?;

    return BlocProvider<SelectPlanCubit>(
      create: (context) => SelectPlanCubit(projectId),
      child: const Scaffold(
          appBar: CustomAppBar(),
          floatingActionButton: FloatingButtons(),
          body: SelectPlanBody()
      ),
    );
  }
}
