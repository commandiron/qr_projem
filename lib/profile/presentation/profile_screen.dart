import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/custom_app_bar.dart';
import 'package:qr_projem/profile/presentation/profile_body.dart';

import '../../core/presentation/widgets/floating_buttons/floating_buttons.dart';
import '../cubit/profile_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const route = "/profile";

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ProfileCubit>(
      create: (context) => ProfileCubit(),
      child: const Scaffold(
        appBar: CustomAppBar(),
        floatingActionButton: FloatingButtons(),
        body: ProfileBody()
      ),
    );
  }
}