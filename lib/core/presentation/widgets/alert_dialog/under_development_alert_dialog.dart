import 'package:flutter/material.dart';

class UnderDevelopmentAlertDialog extends StatelessWidget {
  const UnderDevelopmentAlertDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Container(
        width: 400,
        child: Text("Qr Projem bir startup projesidir ve geliştirme aşamasındadır. Bu yüzden çalışmayan özellikler olabilir. Bir sorun olduğunu düşünüyorsanız lütfen iletişime geçin. Anlayışınız için teşekkür ederiz.")
      ),
    );
  }
}
