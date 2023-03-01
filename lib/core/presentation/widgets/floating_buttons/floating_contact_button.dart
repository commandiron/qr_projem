import 'package:flutter/material.dart';

import '../../config/app_padding.dart';
import '../../helper/url_launcher.dart';

class FloatingContactButton extends StatefulWidget {
  const FloatingContactButton({required this.imagePath, required this.url, Key? key}) : super(key: key);

  final String imagePath;
  final String url;

  @override
  State<FloatingContactButton> createState() => _FloatingContactButtonState();
}

class _FloatingContactButtonState extends State<FloatingContactButton> {

  double _shadowSize = 50;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: AppPadding.allS!,
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
            openURL(widget.url);
          },
          borderRadius: BorderRadius.circular(50),
          child: Container(
            width: _shadowSize,
            height: _shadowSize,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.imagePath)
              ),
              borderRadius: BorderRadius.circular(30),
              boxShadow: const [
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
