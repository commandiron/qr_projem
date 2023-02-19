import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/admin/domain/cubit/admin_cubit.dart';
import 'package:qr_projem/admin/domain/cubit/admin_state.dart';
import 'package:qr_projem/authentication/presentation/authentication_screen.dart';

import '../../core/domain/cubit/project/project_cubit.dart';

class AdminScreen extends StatelessWidget {
  const AdminScreen({Key? key}) : super(key: key);

  static const route = "/admin";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<AdminCubit>(
      create: (context) => AdminCubit(),
      child: const QuickPostPage(),
    );
  }
}


class QuickPostPage extends StatelessWidget {

  const QuickPostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
              onPressed: () {
                BlocProvider.of<ProjectCubit>(context, listen: false).insertProject(AdminState.projectDemirliIns);
              },
              child: Text("Quick Post")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AuthenticationScreen.route);
              },
              child: Text("To Auth Screen")
          ),
        ],
      ),
    );
  }
}


