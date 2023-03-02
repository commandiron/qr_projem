import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';

import '../../core/presentation/widgets/floating_buttons/floating_buttons.dart';
import '../domain/create_new_project_cubit.dart';
import 'create_new_project_body.dart';

class CreateNewProjectScreen extends StatelessWidget {
  const CreateNewProjectScreen({Key? key}) : super(key: key);

  static const route = "/create_new_project";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateNewProjectCubit>(
      create: (context) => CreateNewProjectCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: FloatingButtons(),
        body: CreateNewProjectBody()
      ),
    );
  }
}