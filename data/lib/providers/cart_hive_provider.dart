import 'package:core/core.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';

class CartHiveProvider {
  CartHiveProvider();

  Future<void> addToCart(DishEntity dish) async {
    final Box<CartDishEntity> cartBox = await Hive.openBox('cart');
    final List<CartDishEntity> cartDishesEntity = cartBox.values.toList();
    bool isDishAlreadyInCart = false;

    for (int i = 0; i < cartDishesEntity.length; i++) {
      if (!isDishAlreadyInCart && cartDishesEntity[i].dish.name == dish.name) {
        cartDishesEntity[i].quantity += 1;
        cartBox.put(
          cartDishesEntity[i].dish.name,
          cartDishesEntity[i],
        );
        isDishAlreadyInCart = true;
      }
    }
    if (!isDishAlreadyInCart) {
      cartBox.put(
        dish.name,
        CartDishEntity(
          dish: dish,
          quantity: 1,
        ),
      );
    }
  }

  Future<void> removeFromCart(CartDishEntity cartDishEntity) async {
    final Box<CartDishEntity> cartBox = await Hive.openBox('cart');

    if (cartDishEntity.quantity > 1) {
      cartDishEntity.quantity -= 1;
      cartBox.put(cartDishEntity.dish.name, cartDishEntity);
    } else {
      cartBox.delete(cartDishEntity.dish.name);
    }
  }

  Future<void> clearCart() async {
    final Box<CartDishEntity> cartBox = await Hive.openBox('cart');
    cartBox.clear();
  }

  Future<List<CartDishEntity>> getCartDishes() async {
    final Box<CartDishEntity> cartBox = await Hive.openBox('cart');
    final List<CartDishEntity> cartDishesEntity = cartBox.values.toList();
    return cartDishesEntity;
  }
}
