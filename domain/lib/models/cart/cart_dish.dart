import 'package:domain/domain.dart';

class CartDish {
  final Dish dish;
  int quantity;

  CartDish({
    required this.dish,
    required this.quantity,
  });

  CartDish copyWith({
    Dish? dish,
    int? quantity,
  }) {
    return CartDish(
      dish: dish ?? this.dish,
      quantity: quantity ?? this.quantity,
    );
  }

  List<Object?> get props => <Object?> [
    dish,
    quantity,
  ];
}
