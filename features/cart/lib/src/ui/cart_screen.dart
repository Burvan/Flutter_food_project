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
    final MediaQueryData mediaQuery = MediaQuery.of(context);
    final CartBloc bloc = BlocProvider.of(context);

    return Scaffold(
      body: BlocBuilder<CartBloc, CartState>(
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
                  onMakeAnOrderPressed: () {},
                  onClearCartPressed: () => bloc.add(
                    const ClearCartEvent(),
                  ),
                ),
              ],
            );
          } else {
            return Center(
              child: Container(
                width: mediaQuery.size.width / AppScale.scaleOne5,
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
                    AppString.emptyCartScreen,
                    style: AppTextTheme.font18Bold,
                  ),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
