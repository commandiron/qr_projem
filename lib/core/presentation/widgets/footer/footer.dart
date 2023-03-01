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
        children: [
          AppSpace.horizontalExpanded!,
          Expanded(
            flex: 6,
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset("assets/images/logo/qr_projem_logo_with_text_black_white.png")
                  )
                ),
                AppSpace.horizontalXL!,
                Expanded(
                    child: Row(
                      children: [
                        AppSpace.horizontalExpanded!,
                        BlocBuilder<CoreCubit, CoreState>(
                          builder: (context, state) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const FooterTitle(title: "Hesabım"),
                                AppSpace.verticalL!,
                                state.isUserAuthenticated
                                    ? FooterTextButton(
                                  label: "Profilim",
                                  onPressed: () {},
                                )
                                    : Column(
                                  children: [
                                    FooterTextButton(
                                      label: "Giriş Yap",
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignIn.pageIndex);
                                      },
                                    ),
                                    FooterTextButton(
                                      label: "Kayıt Ol",
                                      onPressed: () {
                                        Navigator.of(context).pushNamed(AuthScreen.route, arguments: SignUp.pageIndex);
                                      },
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        ),
                        AppSpace.horizontalS!,
                        AppSpace.horizontalExpanded!,
                        AppSpace.horizontalS!,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const FooterTitle(title: "Bağlantılar"),
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
                              label: "İletişim",
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
                        AppSpace.horizontalExpanded!,
                      ],
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
