import 'package:core/core.dart';
import 'package:data/data.dart';

part 'order_entity.g.dart';

@HiveType(typeId: 4)
class OrderEntity {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime dateTime;
  @HiveField(2)
  final CartEntity cartEntity;

  const OrderEntity({
    required this.id,
    required this.dateTime,
    required this.cartEntity,
  });

  List<Object?> get props => <Object?>[
        id,
        dateTime,
        cartEntity,
      ];

  factory OrderEntity.fromJson(Map<String, dynamic> json) {
    return OrderEntity(
      id: json['id'] as String,
      dateTime: (json['dateTime'] as Timestamp).toDate(),
      cartEntity: CartEntity.fromJson(json['cartEntity']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'dateTime': dateTime,
      'cartEntity': cartEntity,
    };
  }
}
