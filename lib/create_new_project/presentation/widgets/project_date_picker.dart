import 'package:flutter/material.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import 'date_picker_alert_dialog.dart';

class ProjectDatePicker extends StatelessWidget {
  const ProjectDatePicker({required this.textEditingController, required this.errorText, required this.title, required this.startTime, required this.onSubmit, Key? key}) : super(key: key);

  final TextEditingController textEditingController;
  final String? errorText;
  final String title;
  final DateTime? startTime;
  final void Function(DateTime dateTime) onSubmit;

  @override
  Widget build(BuildContext context) {

    void showDatePickerDialog() {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return DatePickerAlertDialog(
            initialDate: startTime,
            onSubmit: (dateTime) {
              onSubmit(dateTime);
              Navigator.pop(dialogContext);
            },
            onCancel: () {
              Navigator.pop(dialogContext);
            },
          );
        },
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,  style: AppTextStyle.b1,),
        AppSpace.verticalM!,
        Row(
          children: [
            Expanded(
              child: TextField(
                controller: textEditingController,
                readOnly: true,
                decoration: InputDecoration(
                  hintText: "__/__/____",
                  errorText: errorText,
                ),
                onTap: () {
                  showDatePickerDialog();
                },
              ),
            ),
          ],
        ),
      ],
    );
  }
}
