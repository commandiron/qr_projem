import 'package:flutter/material.dart';

class ChoosePlanAlertDialog extends StatelessWidget {
  const ChoosePlanAlertDialog({Key? key, required this.title, required this.content, required this.isLoading, required this.onDecline, required this.onApproved, }) : super(key: key);

  final String title;
  final String content;
  final bool isLoading;
  final void Function()? onDecline;
  final void Function()? onApproved;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        ElevatedButton(
          onPressed: onDecline,
          child: const Text("Geri")
        ),
        ElevatedButton(
          onPressed: onApproved,
          child: isLoading ? Icon(Icons.downloading) : const Text("Devam")
        ),
      ],
    );
  }
}
