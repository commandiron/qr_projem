import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item.dart';

import '../../core/presentation/widgets/copyright_footer.dart';
import '../../core/presentation/widgets/footer/footer.dart';
import '../domain/select_plan_cubit.dart';
import '../domain/select_plan_state.dart';

class SelectPlanBody extends StatelessWidget {
  const SelectPlanBody({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SelectPlanCubit, SelectPlanState>(
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
                        children: const [
                          Expanded(flex: 2, child: SizedBox(width: double.infinity)),
                          Expanded(
                            flex: 6,
                            child: PlanItem(
                              title: "Standart Tasarım",
                              footerText: "Planı Seç ve Qr Kodu Oluştur",
                            )
                          ),
                          Expanded(child: SizedBox(width: double.infinity)),
                          Expanded(
                            flex: 6,
                            child: PlanItem(
                              title: "Özel Tasarım",
                              footerText: "İletişime Geç",
                            )
                          ),
                          Expanded(flex: 2, child: SizedBox(width: double.infinity)),
                        ],
                      ),
                    ),
                  ),
                  Footer(),
                  CopyrightFooter()
                ]
              ),
            )
          ],
        );
      },
    );
  }
}