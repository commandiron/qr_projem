import 'dart:typed_data';

import '../../core/domain/model/project.dart';

class GenerateQrState {
  String? userId;
  String? projectId;
  Uint8List? qrImage;
  PaymentStatus? paymentStatus;

  GenerateQrState(
    {
      required this.userId,
      required this.projectId,
      this.qrImage,
      this.paymentStatus
    }
  );

  GenerateQrState copyWith(
      {
        String? userId,
        String? projectId,
        Uint8List? qrImage,
        PaymentStatus? paymentStatus,
      }
      ) {
    return GenerateQrState(
      userId: userId ?? this.userId,
      projectId: projectId ?? this.projectId,
      qrImage: qrImage ?? this.qrImage,
      paymentStatus: paymentStatus ?? this.paymentStatus
    );
  }
}
