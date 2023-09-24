import 'package:core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_lab_project/app/flutter_lab_project_app.dart';
import 'firebase_options.dart';

Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  appDI.init();
  await dataDI.setupAppLocator();
  await hiveBoxes.openBoxes();
  runApp(const FlutterLabApp());
}


