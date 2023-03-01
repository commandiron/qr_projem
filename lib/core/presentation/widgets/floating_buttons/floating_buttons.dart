import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/widgets/floating_buttons/floating_contact_button.dart';

class FloatingButtons extends StatefulWidget {
  const FloatingButtons({Key? key}) : super(key: key);

  @override
  State<FloatingButtons> createState() => _FloatingButtonsState();
}

class _FloatingButtonsState extends State<FloatingButtons> {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        FloatingContactButton(
            imagePath: "assets/images/contact/instagram.png",
            url: "https://instagram.com/demirlitech/"
        ),
        FloatingContactButton(
          imagePath: "assets/images/contact/whatsapp.png",
          url: "https://api.whatsapp.com/send?phone=905355085552"
        ),
      ],
    );
  }
}
