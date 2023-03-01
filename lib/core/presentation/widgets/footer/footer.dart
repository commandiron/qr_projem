import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/domain/cubit/core/core_cubit.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/core/presentation/widgets/footer/widgets/footer_text_button.dart';
import 'package:qr_projem/core/presentation/widgets/footer/widgets/footer_title.dart';

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
                                      onPressed: () {},
                                    ),
                                    FooterTextButton(
                                      label: "Kayıt Ol",
                                      onPressed: () {},
                                    )
                                  ],
                                )
                              ],
                            );
                          },
                        )
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
