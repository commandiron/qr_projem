import 'package:flutter/material.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';

class QrStateCard extends StatelessWidget {
  const QrStateCard({required this.paymentStatus, required this.trialExpirationDate, Key? key}) : super(key: key);

  final PaymentStatus paymentStatus;
  final DateTime trialExpirationDate;

  @override
  Widget build(BuildContext context) {
    if(paymentStatus == PaymentStatus.pendingStandardPlan) {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: AppPadding.allM!,
          child: Column(
            children: [
              Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row  (
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Durum:",
                            style: AppTextStyle.b1,
                          ),
                          AppSpace.horizontalS!,
                          Text("Ödeme Bekleniyor.", style: AppTextStyle.h3b!.copyWith(color: Theme.of(context).colorScheme.error),)
                        ],
                      ),
                      Text("Qr kodunuz ödeme sonrası aktif hale gelecektir.", style: AppTextStyle.b1!,),
                      Text("Açıklama bölümüne kayıt olduğunuz telefon numaranızı giriniz.", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.error),),
                    ],
                  )
              ),
              Expanded(
                  flex: 2,
                  child: SelectionArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Havale/Eft Bilgileri;", style: AppTextStyle.h3b, textAlign: TextAlign.center,),
                        AppSpace.verticalM!,
                        Text("İsim Soyad: Emir Demirli", style: AppTextStyle.h4,),
                        AppSpace.verticalS!,
                        Text("Banka: Enpara - Finansbank", style: AppTextStyle.h4,),
                        AppSpace.verticalS!,
                        Text("iban: TR12 0011 1000 0000 0066 4574 17", style: AppTextStyle.h4,),
                        AppSpace.verticalS!,
                        Text("Açıklama: Telefon No", style: AppTextStyle.h4!.copyWith(color: Theme.of(context).colorScheme.error),),
                        AppSpace.verticalS!,
                        Text("Tutar: 1500 TL", style: AppTextStyle.h3b,),
                      ],
                    ),
                  )
              )
            ],
          ),
        ),
      );
    }
    if(paymentStatus == PaymentStatus.pendingPersonalizedPlan) {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: AppPadding.allM!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row  (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Durum:",
                    style: AppTextStyle.b1,
                  ),
                  AppSpace.horizontalS!,
                  Text("İletişime Geçilmesi Bekleniyor.", style: AppTextStyle.h4b!.copyWith(color: Theme.of(context).colorScheme.error),)
                ],
              ),
              AppSpace.verticalS!,
              Text(
                "İletişim Bilgileri:",
                style: AppTextStyle.b1,
              ),
              AppSpace.verticalS!,
              Text(
                "Telefon: +90 535 508 55 52",
                style: AppTextStyle.b1,
              ),
            ],
          ),
        ),
      );
    }
    if(paymentStatus == PaymentStatus.approved) {
      return Card(
        color: Colors.white,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: AppPadding.allM!,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row  (
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Durum:",
                    style: AppTextStyle.b1,
                  ),
                  AppSpace.horizontalS!,
                  Row(children: [Icon(Icons.check_circle, color: Color(0xff3AB54A),), Text("Aktif", style: AppTextStyle.h3b!)],)
                ],
              ),
            ],
          ),
        ),
      );
    }
    return SizedBox();
  }
}
