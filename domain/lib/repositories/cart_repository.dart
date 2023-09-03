import 'package:domain/domain.dart';

abstract class CartRepository {
  Future<List<CartDish>> fetchCartDishes(NoParams payload);
  Future<void> addToCart(Dish dish);
  Future<void> removeFromCart(CartDish cartDish);
  Future<void> clearCart(NoParams payload);
}