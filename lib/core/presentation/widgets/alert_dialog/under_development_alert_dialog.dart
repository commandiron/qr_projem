import 'package:flutter/material.dart';

class UnderDevelopmentAlertDialog extends StatelessWidget {
  const UnderDevelopmentAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const AlertDialog(
      content: Text("Qr Projem bir startup projesidir ve geliştirme aşamasındadır. Bu yüzden çalışmayan özellikler olabilir. Anlayışınız için teşekkür ederiz."),
    );
  }
}
