import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/home/domain/cubit/home_cubit.dart';

import '../../core/domain/cubit/core/core_cubit.dart';
import '../../core/presentation/widgets/nav_bar/nav_bar.dart';
import 'home_body.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = "/home";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: Scaffold(
        body: Stack(
          children: [
            const HomeBody(),
            const NavBar(),
            ElevatedButton(
              onPressed: () {
                getUser();
              },
              child: Text("Get Current User")
            )
          ],
        )
      ),
    );
  }

  void getUser() async {
    await BlocProvider.of<CoreCubit>(context, listen: false).getCurrentUser();
  }
}
