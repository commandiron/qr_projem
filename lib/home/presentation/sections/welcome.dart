import 'package:flutter/material.dart';

class Welcome extends StatelessWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 768,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/qr_projem_cover.jpg"),
          fit: BoxFit.cover
        )
      ),
    );
  }
}
