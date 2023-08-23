import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class DetailedDishScreen extends StatelessWidget {
  final Dish dish;

  const DetailedDishScreen({
    Key? key,
    required this.dish,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(dish.name),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: AppPadding.padding25,
              right: AppPadding.padding25,
              top: AppPadding.padding25,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: SelectedDishImage(
                    imagePath: dish.imagePath,
                  ),
                ),
                const SizedBox(height: AppSize.size25),
                Text(
                  dish.name,
                  style: AppTextTheme.font25Bold,
                ),
                const SizedBox(height: AppSize.size20),
                Text(
                  dish.description,
                  style: AppTextTheme.font18.copyWith(
                    color: AppColors.lightGrey,
                  ),
                ),
                const SizedBox(height: AppSize.size20),
                const Text(
                  AppString.ingredients,
                  style: AppTextTheme.font22Bold,
                ),
                const SizedBox(height: AppSize.size20),
                Column(
                  children: dish.ingredients?.map((ingredient) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: AppPadding.padding5,
                          ),
                          child: Row(
                            children: <Widget>[
                              Icon(
                                Icons.circle,
                                size: AppSize.size10,
                                color: themeData.primaryColor,
                              ),
                              const SizedBox(width: AppSize.size5),
                              Text(
                                ingredient,
                                style: AppTextTheme.font16,
                              ),
                            ],
                          ),
                        );
                      }).toList() ??
                      [],
                ),
                const SizedBox(height: AppSize.size25),
                Text(
                  '${AppString.cost}${dish.cost}${AppString.byn}',
                  style: AppTextTheme.font22Bold,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
