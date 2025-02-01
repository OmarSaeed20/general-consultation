 
import 'package:flutter/material.dart';

import 'app.dart';
import 'sl.dart' as di;
import 'dart:async';

// import 'package:firebase_core/firebase_core.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp();
  await di.injection();
  /* SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]); */
  runApp(const ConsultationApp());
}

