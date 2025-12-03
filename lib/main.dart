import 'package:ecommerce_flutter/main_app.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  //Todo: Add Widgets Binding
  //Todo: Init Local Storage
  //Todo: Await Native splash
  //Initialize Firebase
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  //Todo: Initialize Authentication

  runApp(const MainApp());
}
