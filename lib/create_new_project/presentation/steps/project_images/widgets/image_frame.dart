import 'package:flutter/material.dart';

import '../../../../../core/presentation/config/app_padding.dart';

class ImageFrame extends StatefulWidget {
  const ImageFrame({required this.child, required this.onDeleteIconPressed, Key? key}) : super(key: key);

  final Widget child;
  final void Function() onDeleteIconPressed;

  @override
  State<ImageFrame> createState() => _ImageFrameState();
}

class _ImageFrameState extends State<ImageFrame> {

  bool _isOnHover = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: const MaterialStatePropertyAll(Colors.transparent),
      onHover: (value) {
        setState(() {
          _isOnHover = value;
        });
      },
      onTap: widget.onDeleteIconPressed,
      child: AspectRatio(
        aspectRatio: 1,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.black
                ),
              ),
              alignment: Alignment.center,
              padding: AppPadding.allS,
              child: widget.child
            ),
            Container(
              color: _isOnHover ? Colors.black.withOpacity(0.5) : null,
            ),
            if(_isOnHover)
              FittedBox(
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error, size: 64,
                )
              )
          ],
        ),
      ),
    );
  }
}
