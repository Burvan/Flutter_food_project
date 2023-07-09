import 'package:core_ui/src/theme/app_colors.dart';
import 'package:domain/models/dishes/dish.dart';
import 'package:flutter/material.dart';
import 'package:core_ui/core_ui.dart';

class DishTile extends StatelessWidget {
  final Dish dish;

  const DishTile({Key? key, required this.dish}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        color: AppColors.light_pink,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: AppColors.pink_sherbet,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
                padding: const EdgeInsets.all(12),
                child: Text(
                  '${dish.cost} BYN',
                  style: const TextStyle(
                    color: AppColors.bright_pink,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Image.network(
                    dish.imagePath,
                    height: 100,
                  ),
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
                // Text(
                //   dish.description,
                //   maxLines: 2,
                //   style: const TextStyle(
                //     fontSize: 14,
                //   ),
                // ),
                const Spacer(),
                Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      ElevatedButton(
                        onPressed: () {},
                        style: ButtonStyle(
                          backgroundColor: const MaterialStatePropertyAll(
                            AppColors.bright_pink,
                          ),
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
    );
  }
}
