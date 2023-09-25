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

  factory CartEntity.fromJson(Map<String, dynamic> json) {
    return CartEntity(
      cartDishes: (json['cartDishes'] as List<dynamic>)
          .map((cartDish) => CartDishEntity.fromJson(cartDish))
          .toList(),
      totalCost: (json['totalCost'] as num).toDouble(),
    );
  }
}
