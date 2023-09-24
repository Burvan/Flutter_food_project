import 'package:data/data.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart' as domain;

class CartRepositoryImpl implements domain.CartRepository {
  final HiveProvider _hiveProvider;

  const CartRepositoryImpl({
    required HiveProvider hiveProvider,
  }) : _hiveProvider = hiveProvider;

  @override
  Future<void> addToCart(domain.Dish dish) async {
    final DishEntity dishEntity = DishesMapper.toEntity(dish);
    await _hiveProvider.addToCart(dishEntity);
  }

  @override
  Future<List<domain.CartDish>> fetchCartDishes() async {
    final List<CartDishEntity> cartDishes =
        await _hiveProvider.getCartDishes();
    return cartDishes
        .map((CartDishEntity cartDishEntity) =>
            CartDishMapper.fromEntity(cartDishEntity))
        .toList();
  }

  @override
  Future<void> removeFromCart(domain.CartDish cartDish) async {
    final CartDishEntity cartDishEntity =
        CartDishMapper.toEntity(cartDish);
    await _hiveProvider.removeFromCart(cartDishEntity);
  }

  @override
  Future<void> clearCart() async {
    await _hiveProvider.clearCart();
  }
}
