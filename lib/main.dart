import 'package:core/di/app_di.dart';
import 'package:core/di/data_di.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_lab_project/app/flutter_lab_project_app.dart';
import 'firebase_options.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  appDI.init();
  await dataDI.setupAppLocator();
  runApp(const FlutterLabApp());
}


