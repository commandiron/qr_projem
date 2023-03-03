import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/domain/cubit/core/core_state.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/profile_sign_out_button.dart';
import 'package:qr_projem/core/presentation/widgets/app_bar/sing_in_up_button.dart';

import '../../config/app_padding.dart';
import 'app_bar_logo.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({Key? key}) : super(key: key);

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => const Size(double.infinity, 96);
}

class _CustomAppBarState extends State<CustomAppBar> {

  @override
  void initState() {
    BlocProvider.of<CoreCubit>(context, listen: false).getCurrentUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CoreCubit, CoreState>(
      builder: (context, state) {
        return Container(
          padding: AppPadding.verticalM!,
          color: Theme
              .of(context)
              .navigationBarTheme
              .backgroundColor,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AppSpace.horizontalExpanded!,
              Expanded(
                flex: 6,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: AppBarLogo()
                      )
                    ),
                    AppSpace.horizontalXL!,
                    Expanded(
                      child: state.isUserAuthenticated
                        ? const ProfileSignOutButton()
                        : const SignInUpButton(),
                    ),
                  ],
                )
              ),
              AppSpace.horizontalExpanded!,
            ],
          ),
        );
      },
    );
  }
}
