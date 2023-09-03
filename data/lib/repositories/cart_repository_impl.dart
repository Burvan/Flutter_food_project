import 'package:data/data.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/cart/cart_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart' as domain;

class CartRepositoryImpl implements domain.CartRepository {
  final CartHiveProvider _cartHiveProvider;
  final MapperFactory mapper;

  CartRepositoryImpl({
    required this.mapper,
    required CartHiveProvider cartHiveProvider,
  }) : _cartHiveProvider = cartHiveProvider;

  @override
  Future<void> addToCart(domain.Dish dish) async {
    final DishEntity dishEntity = mapper.dishesMapper.toEntity(dish);
    await _cartHiveProvider.addToCart(dishEntity);
  }

  @override
  Future<List<domain.CartDish>> fetchCartDishes(domain.NoParams payload) async {
    final List<CartDishEntity> cartDishes =
        await _cartHiveProvider.getCartDishes();
    return cartDishes
        .map((CartDishEntity cartDishEntity) =>
            mapper.cartDishMapper.fromEntity(cartDishEntity))
        .toList();
  }

  @override
  Future<void> removeFromCart(domain.CartDish cartDish) async {
    final CartDishEntity cartDishEntity =
        mapper.cartDishMapper.toEntity(cartDish);
    await _cartHiveProvider.removeFromCart(cartDishEntity);
  }

  @override
  Future<void> clearCart(domain.NoParams payload) async {
    await _cartHiveProvider.clearCart();
  }
}
