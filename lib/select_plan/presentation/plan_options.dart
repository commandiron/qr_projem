import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_projem/core/presentation/config/app_space.dart';
import 'package:qr_projem/select_plan/presentation/widgets/choose_plan_alert_dialog.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_item.dart';
import 'package:qr_projem/select_plan/presentation/widgets/plan_options_header.dart';

import '../../generate_qr/presentation/generate_qr_screen.dart';
import '../domain/select_plan_cubit.dart';
import '../domain/select_plan_state.dart';

class PlanOptions extends StatelessWidget {
  const PlanOptions({required this.projectId, Key? key}) : super(key: key);

  final String? projectId;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 864,
      child: BlocBuilder<SelectPlanCubit, SelectPlanState>(
        builder: (context, state) {
          return Column(
            children: [
              const Expanded(flex: 3, child: PlanOptionsHeader()),
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
                        discountedPrice: "₺1500",
                        isPriceUnitVisible: true,
                        footerText: "Planı Seç ve Qr Kodu Oluştur",
                        features: const [
                          "1 adet Proje için QR proje kodu",
                          "1 adet sanal proje tanıtım kataloğu.",
                          "Proje başı 2 sene garanti süre.",
                          "7/24 destek."
                        ],
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return ChoosePlanAlertDialog(
                                title: "Standart Paket Seçtiniz",
                                content: "Bir sonraki sayfada Ödeme bilgileriniz ve QR kodunuz oluşturulacaktır. QR kodunuz ödeme yaptıktan sonra aktif hale getirilecektir.",
                                onDecline: () {
                                  Navigator.pop(dialogContext);
                                },
                                onApproved: () {
                                  BlocProvider.of<SelectPlanCubit>(context, listen: false).selectStandardPlan();
                                }
                              );
                            },
                          );
                        },
                      )
                    ),
                    AppSpace.verticalExpanded!,
                    Expanded(
                      flex: 6,
                      child: PlanItem(
                        title: "Kişiselleştirilmiş Paket",
                        price: "Özel Tasarım",
                        footerText: "İletişime Geç",
                        isImageBlurred: true,
                        features: const [
                          "İstenilen adet Proje için QR proje kodu",
                          "İstenilen adet sanal proje tanıtım kataloğu.",
                          "Sınırsız süre.",
                          "7/24 destek.",
                          "Özel tasarım kullanıcı arayüzü.",
                        ],
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (dialogContext) {
                              return ChoosePlanAlertDialog(
                                title: "Kişiselleştirilmiş Paket Seçtiniz",
                                content: "Bir sonraki sayfada QR kodunuz oluşturulacak ve iletişim bilgileri verilecektir.",
                                onDecline: () {
                                  Navigator.pop(dialogContext);
                                },
                                onApproved: () {
                                  BlocProvider.of<SelectPlanCubit>(context, listen: false).selectPersonalizedPlan();
                                }
                              );
                            },
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
          );
        },
      ),
    );
  }
}
