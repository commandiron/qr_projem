import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/generate_qr/presentation/generate_qr_screen.dart';
import 'package:qr_projem/profile/presentation/profile_screen.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/select_plan_cubit.dart';
import '../domain/select_plan_state.dart';

class SelectPlanBody extends StatelessWidget {
  const SelectPlanBody({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SelectPlanCubit, SelectPlanState>(
      listener: (context, state) {
        if(state.projectId == null) {
          Navigator.of(context).pushNamed(ProfileScreen.route);
        }
      },
      builder: (context, state) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Container(
                    height: 768,
                    child: Padding(
                      padding: AppPadding.verticalL!,
                      child: Row(
                        children: [
                          const Expanded(flex: 2, child: SizedBox(width: double.infinity)),
                          Expanded(
                            flex: 6,
                            child: PlanItem(
                              title: "Standart Tasarım",
                              footerText: "Planı Seç ve Qr Kodu Oluştur",
                              onPressed: () {
                                if(state.projectId != null) {
                                  BlocProvider.of<SelectPlanCubit>(context, listen: false).selectStandardPlan().then(
                                    (_) => Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: state.projectId)
                                  );
                                }
                              },
                            )
                          ),
                          const Expanded(child: SizedBox(width: double.infinity)),
                          Expanded(
                            flex: 6,
                            child: PlanItem(
                              title: "Özel Tasarım",
                              footerText: "İletişime Geç",
                              onPressed: () {
                                BlocProvider.of<SelectPlanCubit>(context, listen: false).selectCustomDesign().then(
                                  (_) => Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: state.projectId)
                                );
                              },
                            )
                          ),
                          const Expanded(flex: 2, child: SizedBox(width: double.infinity)),
                        ],
                      ),
                    ),
                  ),
                  const Footer(),
                  const CopyrightFooter()
                ]
              ),
            )
          ],
        );
      },
    );
  }
}