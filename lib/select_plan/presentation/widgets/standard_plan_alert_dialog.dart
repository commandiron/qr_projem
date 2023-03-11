import 'package:flutter/material.dart';

class StandardPlanAlertDialog extends StatelessWidget {
  const StandardPlanAlertDialog({Key? key, this.onDecline, required this.onApproved}) : super(key: key);

  final void Function()? onDecline;
  final void Function()? onApproved;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Standart Paket Seçtiniz"),
      content: const Text("Bir sonraki sayfada Ödeme bilgileriniz ve QR kodunuz oluşturulacaktır. QR kodunuz ödeme yaptıktan sonra aktif hale getirilecektir."),
      actions: [
        ElevatedButton(
          onPressed: onDecline,
          child: const Text("Geri")
        ),
        ElevatedButton(
            onPressed: onApproved,
            child: const Text("Devam")
        ),
      ],
    );
  }
}
