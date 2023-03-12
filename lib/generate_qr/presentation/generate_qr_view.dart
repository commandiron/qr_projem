import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'dart:ui' as ui;

import '../../core/presentation/config/app_space.dart';
import '../../core/presentation/config/app_text_style.dart';

class GenerateQrView extends StatefulWidget {
  const GenerateQrView({required this.userUid, required this.projectId, Key? key}) : super(key: key);

  final String? userUid;
  final String? projectId;

  @override
  State<GenerateQrView> createState() => _GenerateQrViewState();
}

class _GenerateQrViewState extends State<GenerateQrView> {

  Uint8List? _qrImage;

  @override
  void initState() {
    generateQrImage();
    super.initState();
  }

  Future<void> generateQrImage() async {

    const exportSize = 2160;
    const frameThickness = exportSize / 30;
    const imageSize = exportSize - (frameThickness * 2);


    final qrImage = await getQrImage(imageSize);
    final framedImage = await addFrameToImage(
      image: qrImage,
      frameThickness: frameThickness,
    );
    // await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _qrImage = framedImage;
    });
  }

  Future<ui.Image> getQrImage(double imageSize) async {
    return await QrPainter(
      data: "https://virtual.demirli.tech/",
      version: QrVersions.auto,
      gapless: true,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImage(imageSize);
  }

  Future<Uint8List> addFrameToImage({required ui.Image image, required double frameThickness}) async {

    final frameSize = Size(
        image.width + (frameThickness * 2),
        image.height + (frameThickness * 2)
    );

    ui.PictureRecorder recorder = ui.PictureRecorder();

    final canvas = ui.Canvas(recorder);

    final paint = Paint()
      ..isAntiAlias = true
      ..style = PaintingStyle.fill
      ..color = Colors.white;

    canvas.drawRRect(
      RRect.fromRectAndRadius(
          Rect.fromLTWH(0, 0, frameSize.width, frameSize.height),
          const Radius.circular(0)
      ),
      paint,
    );

    final imagePaint = Paint()
      ..isAntiAlias = true
      ..filterQuality = FilterQuality.high;
    final position = Offset(
      (frameSize.width - image.width) / 2.0,
      (frameSize.height - image.height) / 2.0,
    );

    canvas.drawImage(image, position, imagePaint);

    final framedImage = await recorder.endRecording().toImage(frameSize.width.floor(), frameSize.height.floor());

    final byteData = await framedImage.toByteData(format: ui.ImageByteFormat.png);
    return byteData!.buffer.asUint8List();
  }



  Future<void> saveQrImage() async {
    if(_qrImage != null) {
      WebImageDownloader.downloadImageFromUInt8List(uInt8List: _qrImage!);
    }
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
                      child: _qrImage == null
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
                            child: Image.memory(_qrImage!,),
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
                Column(
                  children: [
                    AppSpace.verticalExpanded!,
                    Card(
                      color: Colors.white,
                      child: Padding(
                        padding: AppPadding.allL!,
                        child: Container(
                          width: 300,
                          child: Expanded(
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
