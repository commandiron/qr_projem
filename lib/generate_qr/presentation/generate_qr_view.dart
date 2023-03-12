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
            flex: 3,
            child: Center(child: Text("Qr Kodun Hazır!", style: AppTextStyle.h2!,)),
          ),
          Expanded(
            flex: 12,
            child: Row(
              children: [
                AppSpace.horizontalExpanded!,
                AppSpace.horizontalExpanded!,
                Expanded(
                  flex: 2,
                  child: Card(
                  color: Theme.of(context).colorScheme.primary,
                  child: Padding(
                    padding: AppPadding.allL!,
                    child: Container(
                      width: 300,
                      child: widget.qrImage == null
                          ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircularProgressIndicator(),
                          AppSpace.verticalL!,
                          Text(
                            "Qr kodunuz oluşturuluyor. Lütfen Bekleyiniz.",
                            style: AppTextStyle.h3!,
                            textAlign: TextAlign.center,
                          )
                        ],
                      )
                          : Column(
                        children: [
                          Expanded(
                            flex: 12,
                            child: Image.memory(widget.qrImage,),
                          ),
                          AppSpace.verticalExpanded!,
                          Expanded(
                            child: ElevatedButton(
                                style: ButtonStyle(
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
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Bilgisayarına İndir"),
                                    Icon(Icons.download)
                                  ],
                                )
                            ),
                          ),
                          Expanded(
                            flex: 4 ,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row  (
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Durum:", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                                    AppSpace.horizontalS!,
                                    Text("Ödeme Bekleniyor.", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.onPrimary),),
                                  ],
                                ),
                                Text("Qr kodunuz ödeme sonrası aktif hale gelecektir.", style: AppTextStyle.b1!.copyWith(color: Theme.of(context).colorScheme.onPrimary),)
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                ),

                AppSpace.horizontalExpanded!,
                if(widget.paymentStatus != PaymentStatus.approved)
                  Column(
                    children: [
                      AppSpace.verticalExpanded!,
                      Card(
                        color: Colors.white,
                        child: Padding(
                          padding: AppPadding.allL!,
                          child: Container(
                            width: 300,
                            child: SelectionArea(
                              child: Column(
                                children: [
                                  Text("Havale/Eft Bilgileri;", style: AppTextStyle.h3b, textAlign: TextAlign.center,),
                                  AppSpace.verticalM!,
                                  Text("İsim Soyad: Emir Demirli", style: AppTextStyle.h4,),
                                  AppSpace.verticalS!,
                                  Text("Banka: Enpara - Finansbank", style: AppTextStyle.h4,),
                                  AppSpace.verticalS!,
                                  Text("TR12 0011 1000 0000 0066 4574 17", style: AppTextStyle.h4,),
                                  AppSpace.verticalS!,
                                  Text("Tutar: 1500 TL", style: AppTextStyle.h4,),
                                ],
                              ),
                            )
                          )
                        ),
                      ),
                      AppSpace.verticalExpanded!,
                    ],
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
