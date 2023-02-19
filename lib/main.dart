import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:qr_projem/core/app_core.dart';
import 'package:url_strategy/url_strategy.dart';

import 'firebase_options.dart';

void main() async {
  setPathUrlStrategy();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const AppCore());
}