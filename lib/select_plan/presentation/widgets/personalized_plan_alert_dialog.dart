import 'package:flutter/material.dart';

class PersonalizedPlanAlertDialog extends StatelessWidget {
  const PersonalizedPlanAlertDialog({Key? key, this.onDecline, required this.onApproved}) : super(key: key);

  final void Function()? onDecline;
  final void Function()? onApproved;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Kişiselleştirilmiş Paket Seçtiniz"),
      content: const Text("Bir sonraki sayfada QR kodunuz oluşturulacak ve iletişim bilgileri verilecektir."),
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
