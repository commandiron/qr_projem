import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';

import '../../core/presentation/config/app_space.dart';
import '../../core/presentation/config/app_text_style.dart';

class GenerateQrView extends StatefulWidget {
  const GenerateQrView({required this.qrImage, required this.paymentStatus, Key? key}) : super(key: key);

  final Uint8List qrImage;
  final PaymentStatus paymentStatus;

  @override
  State<GenerateQrView> createState() => _GenerateQrViewState();
}

class _GenerateQrViewState extends State<GenerateQrView> {

  Future<void> saveQrImage() async {
    WebImageDownloader.downloadImageFromUInt8List(uInt8List: widget.qrImage);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 769,
      alignment: Alignment.center,
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: Center(child: Text("Qr Kodun Hazır!", style: AppTextStyle.h2!,)),
          ),
          Expanded(
            flex: 12,
            child: Row(
              children: [
                AppSpace.horizontalExpanded!,
                AppSpace.horizontalExpanded!,
                Expanded(
                  flex: 3,
                  child: Card(
                    color: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: AppPadding.allL!,
                      child: Column(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Row(
                              children: [
                                Expanded(
                                  child: Image.memory(widget.qrImage,),
                                ),
                                Expanded(
                                    child: Card(
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
                                                        widget.paymentStatus == PaymentStatus.approved
                                                            ? Row(children: [Icon(Icons.check_circle, color: Color(0xff3AB54A),), Text("Aktif", style: AppTextStyle.h3b!)],)
                                                            : Text("Ödeme Bekleniyor.", style: AppTextStyle.h3b!.copyWith(color: Theme.of(context).colorScheme.error),)
                                                      ],
                                                    ),
                                                    if(widget.paymentStatus != PaymentStatus.approved)
                                                      Text("Qr kodunuz ödeme sonrası aktif hale gelecektir.", style: AppTextStyle.b1!,),
                                                    if(widget.paymentStatus != PaymentStatus.approved)
                                                      Text("Açıklama bölümüne kayıt olduğunuz telefon numaranızı giriniz.", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.error),),
                                                  ],
                                                )
                                            ),
                                            if(widget.paymentStatus != PaymentStatus.approved)
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
                                    )
                                ),
                              ],
                            )
                          ),
                          Expanded(
                            child: FractionallySizedBox(
                              widthFactor: 0.5,
                              heightFactor: 0.5,
                              child: ElevatedButton(
                                  style: ButtonStyle(
                                      shape: const MaterialStatePropertyAll(
                                          RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(32))
                                          )
                                      ),
                                      backgroundColor: MaterialStatePropertyAll(
                                          Theme.of(context).colorScheme.onPrimary
                                      ),
                                      foregroundColor: MaterialStatePropertyAll(
                                          Theme.of(context).colorScheme.primary
                                      )
                                  ),
                                  onPressed: () {
                                    saveQrImage();
                                  },
                                  child: FittedBox(
                                    fit: BoxFit.scaleDown,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("Qr Kodu Bilgisayarına İndir", style: AppTextStyle.b1b,),
                                        Icon(Icons.download)
                                      ],
                                    ),
                                  )
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                AppSpace.horizontalExpanded!,
                AppSpace.horizontalExpanded!,
              ],
            )
          ),
          AppSpace.verticalExpanded!,
        ],
      ),
    );
  }
}
