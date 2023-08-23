part of 'cart_bloc.dart';

abstract class CartEvent {
  const CartEvent();
}

class AddToCartEvent extends CartEvent {
  final Dish dish;

  AddToCartEvent({
    required this.dish,
  });
}

class RemoveFromCartEvent extends CartEvent {
  final CartDish cartDish;

  RemoveFromCartEvent({
    required this.cartDish,
  });
}

class ClearCartEvent extends CartEvent {
  const ClearCartEvent();
}