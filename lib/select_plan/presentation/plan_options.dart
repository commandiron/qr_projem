import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_options_header.dart';

import '../../generate_qr/presentation/generate_qr_screen.dart';
import '../domain/select_plan_cubit.dart';

class PlanOptions extends StatelessWidget {
  const PlanOptions({required this.projectId, Key? key}) : super(key: key);

  final String? projectId;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 864,
      child: Column(
        children: [
          Expanded(flex: 3, child: const PlanOptionsHeader()),
          Expanded(
            flex: 12,
            child: Row(
              children: [
                AppSpace.verticalExpanded!,
                AppSpace.verticalExpanded!,
                Expanded(
                    flex: 6,
                    child: PlanItem(
                      title: "Standart Paket",
                      price: "₺2500",
                      isPriceUnitVisible: true,
                      footerText: "Planı Seç ve Qr Kodu Oluştur",
                      features: const [
                        "1 adet Proje için QR proje kodu",
                        "1 adet sanal proje tanıtım kataloğu.",
                        "Proje başı 2 sene garanti süre.",
                        "7/24 destek."
                      ],
                      onPressed: () {
                        if(projectId != null) {
                          BlocProvider.of<SelectPlanCubit>(context, listen: false).selectStandardPlan().then(
                            (_) => Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: projectId)
                          );
                        }
                      },
                    )
                ),
                AppSpace.verticalExpanded!,
                Expanded(
                    flex: 6,
                    child: PlanItem(
                      title: "Gelişmiş Paket",
                      price: "Özel Tasarım",
                      footerText: "İletişime Geç",
                      isImageBlurred: true,
                      features: [
                        "İstenilen adet Proje için QR proje kodu",
                        "İstenilen adet sanal proje tanıtım kataloğu.",
                        "Sınırsız süre.",
                        "7/24 destek.",
                        "Özel tasarım kullanıcı arayüzü.",
                      ],
                      onPressed: () {
                        BlocProvider.of<SelectPlanCubit>(context, listen: false).selectCustomDesign().then(
                          (_) => Navigator.of(context).pushNamed(GenerateQrScreen.route, arguments: projectId)
                        );
                      },
                    )
                ),
                AppSpace.verticalExpanded!,
                AppSpace.verticalExpanded!,
              ],
            ),
          ),
          AppSpace.verticalExpanded!
        ],
      ),
    );
  }
}
