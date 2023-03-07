import 'package:flutter/material.dart';

import '../../../../../core/presentation/config/app_padding.dart';

class DeleteFrame extends StatefulWidget {
  const DeleteFrame({required this.child, required this.onDeleteIconPressed, Key? key}) : super(key: key);

  final Widget child;
  final void Function() onDeleteIconPressed;

  @override
  State<DeleteFrame> createState() => _DeleteFrameState();
}

class _DeleteFrameState extends State<DeleteFrame> {

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: Stack(
        alignment: Alignment.topRight,
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
          InkWell(
            onTap: widget.onDeleteIconPressed,
            customBorder: const CircleBorder(),
            child: FittedBox(
              child: Padding(
                padding: AppPadding.allM!,
                child: Icon(
                  Icons.delete,
                  color: Theme.of(context).colorScheme.error, size: 32,
                ),
              )
            ),
          )
        ],
      ),
    );
  }
}
