import 'package:cart/src/bloc/cart_bloc.dart';
import 'package:cart/src/ui/widgets/cart_dish_tile.dart';
import 'package:cart/src/ui/widgets/total_cost.dart';
import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return Scaffold(body: BlocBuilder<CartBloc, CartState>(
      builder: (_, CartState state) {
        if (state.cart.cartDishes.isNotEmpty) {
          return Column(
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: state.cart.cartDishes.length,
                  itemBuilder: (_, int index) {
                    return CartDishTile(
                      cartDish: state.cart.cartDishes.elementAt(index),
                    );
                  },
                ),
              ),
              TotalCost(
                totalCost: state.cart.totalCost,
                onPressed: () {},
              ),
            ],
          );
        } else {
          return Center(
            child: Container(
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: themeData.cardColor,
                borderRadius: BorderRadius.circular(
                  AppBorderRadius.borderRadius12,
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: AppPadding.padding40,
                  horizontal: AppPadding.padding24,
                ),
                child: Text(
                  'Your shopping cart is empty. '
                      'You can select dishes on the home screen.',
                  style: AppTextTheme.font18Bold,
                ),
              ),
            ),
          );
        }
      },
    ));
  }
}