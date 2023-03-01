import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:qr_projem/core/presentation/widgets/floating_buttons/floating_buttons.dart';
import 'package:qr_projem/home/domain/cubit/home_cubit.dart';
import 'home_body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const route = "/home";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<HomeCubit>(
      create: (context) => HomeCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: FloatingButtons(),
        body: HomeBody(),
      ),
    );
  }
}
