import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/admin/domain/cubit/admin_cubit.dart';
import 'package:qr_projem/auth/presentation/auth_screen.dart';

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
                BlocProvider.of<AdminCubit>(context, listen: false).adminInsert();
              },
              child: const Text("Quick Post")
          ),
          ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed(AuthScreen.route);
              },
              child: const Text("To Auth Screen")
          ),
        ],
      ),
    );
  }
}


