import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/auth/presentation/auth_screen.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/widgets/alert_dialog/under_development_alert_dialog.dart';
import 'package:qr_projem/core/presentation/widgets/footer/widgets/footer_text_button.dart';
import 'package:qr_projem/core/presentation/widgets/footer/widgets/footer_title.dart';

import '../../../../auth/presentation/sections/sign_in.dart';
import '../../../../auth/presentation/sections/sign_up.dart';
import '../../../domain/cubit/core/core_state.dart';

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 256,
      color: Theme.of(context).colorScheme.secondaryContainer,
      alignment: Alignment.centerLeft,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AppSpace.horizontalExpanded!,
          Expanded(
            flex: 6,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/logo/qr_projem_logo_with_text_black_white.png")
                  )
                ),
                AppSpace.horizontalXL!,
                Expanded(
                  child: Align(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                          flex: 3,
                          child: BlocBuilder<CoreCubit, CoreState>(
                            builder: (context, state) {
                              return FittedBox(
                                fit: BoxFit.scaleDown,
                                child: Column(
                                  children: [
                                    const FooterTitle(title: "Hesab??m"),
                                    AppSpace.verticalL!,
                                    state.isUserAuthenticated
                                        ? FooterTextButton(
                                      label: "Profilim",
                                      onPressed: () {},
                                    )
                                        : Column(
                                      children: [
                                        FooterTextButton(
                                          label: "Giri?? Yap",
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignIn.pageIndex);
                                          },
                                        ),
                                        FooterTextButton(
                                          label: "Kay??t Ol",
                                          onPressed: () {
                                            Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignUp.pageIndex);
                                          },
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                        AppSpace.horizontalExpanded!,
                        Expanded(
                          flex: 3,
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Column(
                              children: [
                                const FooterTitle(title: "Ba??lant??lar"),
                                AppSpace.verticalL!,
                                FooterTextButton(
                                  label: "Biz Kimiz",
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const UnderDevelopmentAlertDialog();
                                      },
                                    );
                                  },
                                ),
                                FooterTextButton(
                                  label: "??leti??im",
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (context) {
                                        return const UnderDevelopmentAlertDialog();
                                      },
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                        AppSpace.horizontalExpanded!,
                        Expanded(
                          flex: 3,
                          child: SizedBox()
                        ),
                      ],
                    ),
                  )
                )
              ],
            )
          ),
          AppSpace.horizontalExpanded!,
        ],
      ),
    );
  }
}
