import 'package:domain/domain.dart';

class Order {
  final String id;
  final DateTime datetime;
  final Cart cart;

  const Order({
    required this.id,
    required this.datetime,
    required this.cart,
  });

  Order copyWith({
    String? id,
    DateTime? dateTime,
    Cart? cart,
  }) {
    return Order(
      id: id ?? this.id,
      datetime: datetime ?? this.datetime,
      cart: cart ?? this.cart,
    );
  }

  List<Object?> get props => <Object?> [
    id,
    datetime,
    cart,
  ];
}
