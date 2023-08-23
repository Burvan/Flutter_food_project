import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class SelectedDishImage extends StatelessWidget {
  final String imagePath;

  const SelectedDishImage({
    Key? key,
    required this.imagePath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Hero(
      tag: imagePath,
      child: Image.network(
        imagePath,
        height: mediaQueryData.size.height * AppScale.scaleZero3,
      ),
    );
  }
}
