import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:boombim_makerstar/screen/boombimscreen.dart';
import 'package:boombim_makerstar/screen/test.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(
    MaterialApp(
    home: BoombimScreen(),
    )
  );
}



