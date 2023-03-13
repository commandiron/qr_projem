import 'dart:typed_data';

import 'package:qr_projem/core/presentation/helper/ui_state.dart';

import '../../core/domain/model/project.dart';

class GenerateQrState {
  UiState uiState;
  String? userId;
  String? projectId;
  Uint8List? qrImage;
  PaymentStatus? paymentStatus;

  GenerateQrState(
    {
      required this.uiState,
      required this.userId,
      required this.projectId,
      this.qrImage,
      this.paymentStatus
    }
  );

  GenerateQrState copyWith(
      {
        UiState? uiState,
        String? userId,
        String? projectId,
        Uint8List? qrImage,
        PaymentStatus? paymentStatus,
      }
      ) {
    return GenerateQrState(
      uiState: uiState ?? this.uiState,
      userId: userId ?? this.userId,
      projectId: projectId ?? this.projectId,
      qrImage: qrImage ?? this.qrImage,
      paymentStatus: paymentStatus ?? this.paymentStatus
    );
  }
}
