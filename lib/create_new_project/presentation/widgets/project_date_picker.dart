import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/presentation/config/app_space.dart';
import '../../../core/presentation/config/app_text_style.dart';
import 'date_picker_alert_dialog.dart';

class ProjectDatePicker extends StatefulWidget {
  const ProjectDatePicker({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  State<ProjectDatePicker> createState() => _ProjectDatePickerState();
}

class _ProjectDatePickerState extends State<ProjectDatePicker> {

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    void showDatePickerDialog() {
      showDialog(
        context: context,
        builder: (dialogContext) {
          return DatePickerAlertDialog(
            onSubmit: (dateTime) {
              setState(() {
                _controller.text = DateFormat("dd/MM/yyyy").format(dateTime);
              });
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
        Text(widget.title,  style: AppTextStyle.b1,),
        AppSpace.verticalM!,
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: _controller,
                readOnly: true,
                decoration: const InputDecoration(
                  hintText: "__/__/____",
                ),
                validator: (value) {
                  if(value == "") {
                    return "Lütfen ilgili alanı doldurunuz.";
                  }
                },
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
