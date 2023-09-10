import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class MenuDishImage extends StatelessWidget {
  final String imagePath;
  final double height;

  const MenuDishImage({
    required this.height,
    required this.imagePath,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Hero(
      tag: imagePath,
      child: CachedNetworkImage(
        imageUrl: imagePath,
        height: height,
        placeholder: (
          BuildContext context,
          String url,
        ) {
          return SizedBox(
            child: Center(
              child: CircularProgressIndicator(
                color: themeData.primaryColor,
              ),
            ),
          );
        },
      ),
    );
  }
}
