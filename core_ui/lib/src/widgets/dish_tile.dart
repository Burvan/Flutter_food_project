import 'package:core_ui/src/widgets/menu_dish_image.dart';
import 'package:domain/models/dishes/dish.dart';
import 'package:flutter/material.dart';

class DishTile extends StatelessWidget {
  final Dish dish;
  final VoidCallback onTap;

  const DishTile({
    Key? key,
    required this.dish,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: themeData.cardColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: themeData.secondaryHeaderColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(12),
                          topRight: Radius.circular(12),
                        ),
                      ),
                      padding: const EdgeInsets.all(12),
                      child: Text(
                        '${dish.cost} BYN',
                        style: TextStyle(
                          color: themeData.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12,),
                        child: MenuDishImage(imagePath: dish.imagePath),
                        // child: Image.network(
                        //   dish.imagePath,
                        //   height: 100,
                        // ),
                      ),
                      Text(
                        dish.name,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 5),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(18.0),
                                  ),
                                ),
                              ),
                              child: const Text('+Add'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
