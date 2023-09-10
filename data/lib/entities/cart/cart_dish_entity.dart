import 'package:core/core.dart';
import '../dishes/entities/dish_entity.dart';

part 'cart_dish_entity.g.dart';

@HiveType(typeId: 1)
class CartDishEntity {
  @HiveField(0)
  final DishEntity dish;

  @HiveField(1)
  int quantity;

  CartDishEntity({
    required this.dish,
    required this.quantity,
  });

  List<Object?> get props => <Object?>[
    dish,
    quantity,
  ];
}
