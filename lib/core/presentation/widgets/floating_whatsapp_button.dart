import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_padding.dart';
import 'package:qr_projem/core/presentation/helper/url_launcher.dart';

class FloatingWhatsappButton extends StatefulWidget {
  const FloatingWhatsappButton({Key? key}) : super(key: key);

  @override
  State<FloatingWhatsappButton> createState() => _FloatingWhatsappButtonState();
}

class _FloatingWhatsappButtonState extends State<FloatingWhatsappButton> {

  double _shadowSize = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: AppPadding.allM!,
      child: InkWell(
        onHover: (value) {
          setState(() {
            if(value) {
              _shadowSize = 60;
            } else {
              _shadowSize = 50;
            }
          });
        },
        onTap: () {
          openURL("https://api.whatsapp.com/send?phone=905355085552");
        },
        borderRadius: BorderRadius.circular(50),
        child: Container(
          width: _shadowSize,
          height: _shadowSize,
          decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/images/contact/whatsapp.png")),
            borderRadius: BorderRadius.circular(30),
            boxShadow: [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 4,
              ),
            ],
          ),
        ),
      )
    );
  }
}
