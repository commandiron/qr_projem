import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/domain/cubit/core/core_state.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/profile_sign_out_button.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/sing_in_up_button.dart';

import '../../config/app_padding.dart';
import 'app_bar_logo.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, state) {
        return Container(
          padding: AppPadding.horizontalXXXL!.add(AppPadding.verticalM!),
          color: Theme
              .of(context)
              .navigationBarTheme
              .backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AppBarLogo(),
              state.isUserAuthenticated
                ? const ProfileSignOutButton()
                : const SignInUpButton()
            ],
          ),
        );
      },
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, 96);
}
