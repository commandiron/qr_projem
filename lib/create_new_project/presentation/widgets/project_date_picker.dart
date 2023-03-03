import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import 'date_picker_alert_dialog.dart';

class ProjectDatePicker extends StatelessWidget {
  const ProjectDatePicker({required this.title, required this.startTime, required this.onSubmit, Key? key}) : super(key: key);

  final String title;
  final DateTime? startTime;
  final void Function(DateTime dateTime) onSubmit;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,  style: AppTextStyle.b1,),
        AppSpace.verticalM!,
        Row(
          children: [
            Text(
              startTime == null
                ? "__-__-____"
                : DateFormat("dd-MM-yyyy").format(startTime!)
            ),
            IconButton(
                onPressed: () {
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
                },
                icon: const Icon(Icons.date_range)
            )
          ],
        ),
      ],
    );
  }
}
