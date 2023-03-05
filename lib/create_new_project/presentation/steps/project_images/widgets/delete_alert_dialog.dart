import 'package:flutter/material.dart';

class DeleteAlertDialog extends StatelessWidget {
  const DeleteAlertDialog({required this.dialogContext, required this.onApproved, required this.onRejected, Key? key}) : super(key: key);

  final BuildContext dialogContext;
  final void Function() onApproved;
  final void Function() onRejected;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Text("Silmek istediğinize emin misiniz?"),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.pop(dialogContext);
            onRejected();
          },
          child: Text("Hayır"),
        ),
        ElevatedButton(
          onPressed: () {
            onApproved();
            Navigator.pop(dialogContext);
          },
          child:Text("Sil"),
        ),
      ],
    );
  }
}
