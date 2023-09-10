import 'cart_dish_entity.dart';

class CartEntity {
  final List<CartDishEntity> cartDishes;
  final double totalCost;

  CartEntity({
    required this.cartDishes,
    required this.totalCost,
  });

  List<Object?> get props => [
    cartDishes,
    totalCost,
  ];
}
