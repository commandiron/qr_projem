import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_downloader_web/image_downloader_web.dart';
import 'package:qr_flutter/qr_flutter.dart';
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
    final qrImage = await getQrImage();
    final framedImage = await addFrameToImage(
      image: qrImage,
      frameThickness: qrImage.width / 30,
    );
    await Future.delayed(const Duration(seconds: 2));
    setState(() {
      _qrImage = framedImage;
    });
  }

  Future<ui.Image> getQrImage() async {
    return await QrPainter(
      data: "https://virtual.demirli.tech/",
      version: QrVersions.auto,
      gapless: true,
      color: Colors.black,
      emptyColor: Colors.white,
    ).toImage(400);
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
          Container(
            width: 400,
            height: 400,
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
                : Image.memory(_qrImage!,),
          ),
          ElevatedButton(
              onPressed: () {
                saveQrImage();
              },
              child: Text("Save")
          )
        ],
      ),
    );
  }
}
