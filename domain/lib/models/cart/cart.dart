import 'cart_dish.dart';

class Cart {
  final List<CartDish> cartDishes;
  final int totalCost;

  const Cart({
    required this.cartDishes,
    required this.totalCost,
  });

  Cart copyWith({List<CartDish>? cartDishes, int? totalCost}) {
    return Cart(
      cartDishes: cartDishes ?? this.cartDishes,
      totalCost: totalCost ?? this.totalCost,
    );
  }

  List<Object?> get props => <Object?> [
    cartDishes,
    totalCost,
  ];
}
