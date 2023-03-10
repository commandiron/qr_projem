import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';

import '../../core/presentation/widgets/app_bar/custom_app_bar.dart';
import '../../core/presentation/widgets/floating_buttons/floating_buttons.dart';
import '../domain/generate_qr_cubit.dart';
import 'generate_qr_body.dart';

class GenerateQrScreen extends StatelessWidget {
  const GenerateQrScreen({Key? key}) : super(key: key);

  static const route = "/generate_qr";

  @override
  Widget build(BuildContext context) {
    final projectId = ModalRoute
        .of(context)!
        .settings
        .arguments as String?;

    final userUid = BlocProvider.of<CoreCubit>(context).state.userUid;

    return BlocProvider<GenerateQrCubit>(
      create: (context) => GenerateQrCubit(userUid, projectId)..init(),
      child: const Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: FloatingButtons(),
        body: GenerateQrBody()
      ),
    );
  }
}
