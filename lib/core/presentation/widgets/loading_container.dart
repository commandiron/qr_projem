import 'package:flutter/material.dart';

import '../config/app_space.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer ({this.height, this.text, Key? key}) : super(key: key);

  final double? height;
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 768,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircularProgressIndicator(),
          if(text != null)
            Column(
              children: [
                AppSpace.verticalL!,
                Text(text!)
              ],
            )
        ],
      ),
    );
  }
}
