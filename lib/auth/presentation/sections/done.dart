import 'package:flutter/material.dart';
import 'package:qr_projem/profile/presentation/profile_screen.dart';

class Done extends StatefulWidget {
  const Done({Key? key}) : super(key: key);

  static const pageIndex = 2;

  @override
  State<Done> createState() => _DoneState();
}

class _DoneState extends State<Done> {

  @override
  void initState() {
    Navigator.of(context).pushNamed(ProfileScreen.route);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text("DONE!!!!!!!!!!!!!"),
    );
  }
}
