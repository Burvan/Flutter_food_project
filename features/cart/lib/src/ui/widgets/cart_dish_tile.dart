import 'package:cart/src/bloc/cart_bloc.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';

class CartDishTile extends StatelessWidget {
  final CartDish cartDish;

  const CartDishTile({
    required this.cartDish,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final CartBloc cartBloc = BlocProvider.of<CartBloc>(context);
    final ThemeData themeData = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.only(
        top: AppPadding.padding5,
        right: AppPadding.padding5,
        left: AppPadding.padding5,
      ),
      child: Card(
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
          padding: const EdgeInsets.all(
            AppPadding.padding10,
          ),
          child: Row(
            children: <Widget>[
              MenuDishImage(imagePath: cartDish.dish.imagePath),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Text(
                      cartDish.dish.name,
                      style: AppTextTheme.font18Bold,
                    ),
                    const SizedBox(
                      height: AppSize.size5,
                    ),
                    Text(
                      '${cartDish.dish.cost} BYN',
                      style: AppTextTheme.font14Bold,
                    ),
                  ],
                ),
              ),
              Row(
                children: <Widget>[
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        RemoveFromCartEvent(
                          cartDish: cartDish,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.remove_circle_outline,
                      color: themeData.primaryColor,
                    ),
                  ),
                  Text(
                    '${cartDish.quantity}',
                    style: AppTextTheme.font18,
                  ),
                  IconButton(
                    onPressed: () {
                      cartBloc.add(
                        AddToCartEvent(
                          dish: cartDish.dish,
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle_outline,
                      color: themeData.primaryColor,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}