import 'package:flutter/material.dart';
import 'package:qr_projem/core/presentation/config/app_text_style.dart';

class ReferenceQrs extends StatelessWidget {
  const ReferenceQrs({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 768,
      color: Colors.black,
      child: Row(
        children: [
          Expanded(
            flex:2,
            child: Column(
              children: [
                Expanded(
                  child:  Container(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Theme.of(context).colorScheme.background,
                          width: 2
                        )
                    ),
                  )
                ),
                Expanded(
                  child:  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Theme.of(context).colorScheme.background,
                        width: 2
                      )
                    ),
                  )
                ),
              ],
            )
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Theme.of(context).colorScheme.background,
                  width: 2
                )
              ),
            )
          )
        ],
      )
    );
  }
}
