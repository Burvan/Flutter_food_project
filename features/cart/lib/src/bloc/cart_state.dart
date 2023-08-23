part of 'cart_bloc.dart';

class CartState {
  final Cart cart;

  CartState({
    required this.cart,
  });

  CartState.empty()
      : cart = const Cart(
    cartDishes: [],
    totalCost: 0,
  );

  CartState copyWith({
    Cart? cart,
  }) {
    return CartState(
      cart: cart ?? this.cart,
    );
  }
}