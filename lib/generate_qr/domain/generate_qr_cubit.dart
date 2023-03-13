import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'dart:ui' as ui;

import '../../core/data/repositories/project_repository.dart';
import '../../core/presentation/helper/ui_state.dart';
import 'generate_qr_state.dart';

class GenerateQrCubit extends Cubit<GenerateQrState> {
  GenerateQrCubit(
    String? userId,
    String? projectId
  ) : super(
    GenerateQrState(
      uiState: UiInitial(),
      userId: userId,
      projectId: projectId,
    )
  );

  final ProjectRepository _projectRepository = ProjectRepository();

  Future<void> init() async {
    emit(state.copyWith(uiState: UiLoading()));
    await generateQrImage();
    await getPaymentStatus();
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

    emit(state.copyWith(qrImage: framedImage));
  }

  Future<ui.Image> getQrImage(double imageSize) async {
    return await QrPainter(
      data: "https://virtual.demirli.tech/?uid=${state.userId}&projectId=${state.projectId}",
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

  Future<void> getPaymentStatus() async {
    if(state.projectId != null && state.userId != null) {
      final project = await _projectRepository.getUserProjectById(state.projectId!);
      if(project == null) {
        emit(state.copyWith(uiState: UiError()));
      }
      emit(state.copyWith(uiState: UiSuccess(), paymentStatus: project?.paymentStatus));
    } else {
      emit(state.copyWith(uiState: UiError()));
    }
  }
}
