import 'package:core/core.dart';
import 'package:cart/cart.dart';
import 'package:core_ui/core_ui.dart';
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
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    final MediaQueryData mediaQueryData = MediaQuery.of(context);

    return InkWell(
      borderRadius: BorderRadius.circular(AppBorderRadius.borderRadius12),
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.padding12),
        child: Container(
          clipBehavior: Clip.hardEdge,
          decoration: BoxDecoration(
            border: Border.all(color: themeData.secondaryHeaderColor),
            boxShadow: [
              BoxShadow(
                blurRadius: AppBorderRadius.borderRadius7,
                color: themeData.primaryColor.withOpacity(0.6),
                offset: const Offset(0, 2),
              ),
            ],
            color: themeData.cardColor,
            borderRadius: BorderRadius.circular(AppBorderRadius.borderRadius12),
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
                      '${dish.cost}${AppString.byn}',
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
                        height:
                            mediaQueryData.size.height * AppScale.scaleZero13,
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
                            onPressed: () {
                              try {
                                cartBloc.add(
                                  AddToCartEvent(dish: dish),
                                );
                                final SnackBar snackBar = SnackBar(
                                  content: Text(
                                    '${AppString.youHaveAdded}${dish.name}'
                                    '${AppString.toTheCart}',
                                    style: AppTextTheme.font18Bold,
                                  ),
                                  behavior: SnackBarBehavior.fixed,
                                  padding: const EdgeInsets.all(
                                    AppPadding.padding20,
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor:
                                      themeData.secondaryHeaderColor,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              } catch (error) {
                                final SnackBar snackBar = SnackBar(
                                  content: Text(
                                    '${AppString.errorMessage}$error',
                                    style: AppTextTheme.font18Bold,
                                  ),
                                  behavior: SnackBarBehavior.fixed,
                                  padding: const EdgeInsets.all(
                                    AppPadding.padding20,
                                  ),
                                  duration: const Duration(seconds: 2),
                                  backgroundColor:
                                      themeData.secondaryHeaderColor,
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              }
                            },
                            style: ButtonStyle(
                              shape: MaterialStatePropertyAll(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                    AppBorderRadius.borderRadius18,
                                  ),
                                ),
                              ),
                            ),
                            child: const Row(
                              children: <Widget>[
                                Text(AppString.add),
                                Icon(Icons.add_shopping_cart_sharp),
                              ],
                            ),
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
      ),
    );
  }
}
