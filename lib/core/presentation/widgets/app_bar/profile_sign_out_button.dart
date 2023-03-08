import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/home/presentation/home_screen.dart';
import 'package:qr_projem/profile/presentation/profile_screen.dart';

import '../../../../admin/presentation/admin_screen.dart';

class ProfileSignOutButton extends StatelessWidget {
  const ProfileSignOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: () {
            if(BlocProvider.of<CoreCubit>(context).state.isUserAdmin){
              Navigator.of(context).pushNamed(AdminScreen.route);
            } else {
              Navigator.of(context).pushNamed(ProfileScreen.route);
            }
          },
          child: const Icon(
            Icons.person
          ),
        ),
        AppSpace.horizontalL!,
        ElevatedButton(
          onPressed: () {
            BlocProvider.of<CoreCubit>(context, listen: false).signOut();
            Navigator.of(context).pushNamed(HomeScreen.route);
          },
          child: const Text("Çıkış Yap")
        ),
      ],
    );
  }
}
