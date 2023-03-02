import 'package:flutter/material.dart';

class AddProjectButton extends StatefulWidget {
  const AddProjectButton({this.onTap, Key? key}) : super(key: key);

  final void Function()? onTap;

  @override
  State<AddProjectButton> createState() => _AddProjectButtonState();
}

class _AddProjectButtonState extends State<AddProjectButton> {

  Color _buttonColor = Colors.grey;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (value) {
        setState(() {
          if(value) {
            _buttonColor = Theme.of(context).colorScheme.primary;
          } else {
            _buttonColor = Colors.grey;
          }
        });
      },
      onTap: widget.onTap,
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              color: _buttonColor,
              width: 2
            )
          ),
          child: Icon(
            Icons.add,
            size: 64,
            color: _buttonColor,
          ),
        ),
      ),
    );
  }
}
