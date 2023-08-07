import 'package:flutter/material.dart';

class MenuDishImage extends StatelessWidget {
  final String imagePath;

  const MenuDishImage({
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
        height: mediaQueryData.size.height * 0.13,
      ),
    );
  }
}
