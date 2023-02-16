import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/admin/domain/cubit/project_cubit.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  static const route = "/admin";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProjectCubit>(
      create: (context) => ProjectCubit(),
      child: const QuickPostPage(),
    );
  }
}


class QuickPostPage extends StatelessWidget {
  const QuickPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
          onPressed: () {
            BlocProvider.of<ProjectCubit>(context, listen: false).quickPost();
          },
          child: Text("Quick Post")
      ),
    );
  }
}


