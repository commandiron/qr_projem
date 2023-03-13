import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:qr_projem/core/domain/model/project.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/generate_qr/presentation/widgets/qr_state_card.dart';

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
                                  child: QrStateCard(paymentStatus: widget.paymentStatus)
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
