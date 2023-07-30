import 'package:flutter/material.dart';
import 'package:main_page/main_page.dart';

class FlutterLabApp extends StatelessWidget {
  const FlutterLabApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainPageScreen(),
    );
  }
}
