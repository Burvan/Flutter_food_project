import 'package:core_ui/core_ui.dart';
import 'package:core_ui/src/theme/app_dimensions.dart';
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
      padding: const EdgeInsets.all(AppPadding.padding12),
      child: Stack(
        children: [
          Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              border: Border.all(color: themeData.secondaryHeaderColor),
              boxShadow: [
                BoxShadow(
                  blurRadius: 7,
                  color: themeData.primaryColor.withOpacity(0.6),
                  offset: const Offset(0, 2),
                ),
              ],
              color: themeData.cardColor,
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.borderRadius12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                        color: themeData.secondaryHeaderColor,
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(
                            AppBorderRadius.borderRadius12,
                          ),
                          topRight: Radius.circular(
                            AppBorderRadius.borderRadius12,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.all(AppPadding.padding12),
                      child: Text(
                        '${dish.cost} BYN',
                        style: AppTextTheme.font14Bold.copyWith(
                          color: themeData.primaryColor,
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
                          horizontal: AppPadding.padding24,
                          vertical: AppPadding.padding12,
                        ),
                        child: MenuDishImage(
                          imagePath: dish.imagePath,
                        ),
                      ),
                      Text(
                        dish.name,
                        style: AppTextTheme.font18Bold,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: AppSize.size5),
                      const Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(
                          bottom: AppPadding.padding5,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            ElevatedButton(
                              onPressed: () {},
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppBorderRadius.borderRadius18,
                                    ),
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
              borderRadius:
                  BorderRadius.circular(AppBorderRadius.borderRadius12),
              onTap: onTap,
            ),
          ),
        ],
      ),
    );
  }
}
