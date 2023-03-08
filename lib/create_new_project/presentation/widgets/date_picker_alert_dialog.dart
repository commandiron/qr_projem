import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class DatePickerAlertDialog extends StatelessWidget {
  const DatePickerAlertDialog({this.initialDate, required this.onSubmit, required this.onCancel, Key? key}) : super(key: key);

  final DateTime? initialDate;
  final void Function(DateTime dateTime) onSubmit;
  final void Function() onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: SizedBox(
        height: 300,
        width: 300,
        child: Column(
          children: [
            SfDateRangePicker(
              initialSelectedDate: initialDate,
              initialDisplayDate: initialDate,
              confirmText: "Seç",
              cancelText: "Geri Dön",
              showActionButtons: true,
              onCancel: onCancel,
              onSubmit: (value) {
                if(value is DateTime) {
                  onSubmit(value);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
