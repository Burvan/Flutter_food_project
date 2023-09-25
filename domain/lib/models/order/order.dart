import 'package:domain/domain.dart';

class Order {
  final String id;
  final DateTime dateTime;
  final Cart cart;

  const Order({
    required this.id,
    required this.dateTime,
    required this.cart,
  });

  Order copyWith({
    String? id,
    DateTime? dateTime,
    Cart? cart,
  }) {
    return Order(
      id: id ?? this.id,
      dateTime: dateTime ?? this.dateTime,
      cart: cart ?? this.cart,
    );
  }

  List<Object?> get props => <Object?> [
    id,
    dateTime,
    cart,
  ];
}
