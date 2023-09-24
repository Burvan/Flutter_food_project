import 'package:core/core.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/entities/user/user_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart' as domain;

class HiveProvider {
  final MapperFactory mapper;

  HiveProvider({required this.mapper});

  ///Auth
  Future<void> saveUser(domain.AppUser user) async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    final UserEntity userEntity = mapper.userMapper.toEntity(user);
    await userBox.add(userEntity);
  }

  Future<void> deleteUser() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    await userBox.clear();
  }

  Future<UserEntity> getUser() async {
    final Box<UserEntity> userBox = await Hive.openBox('user');
    return userBox.isNotEmpty
        ? userBox.values.first
        : UserEntity(
            id: '',
            name: '',
            email: '',
          );
  }

  ///Home
  Future<void> saveDishesToCache(List<domain.Dish> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    if (dishesBox.isEmpty) {
      final List<DishEntity> dishesEntity = dishes
          .map((domain.Dish dish) => mapper.dishesMapper.toEntity(dish))
          .toList();
      await dishesBox.addAll(dishesEntity);
    }
  }

  Future<List<DishEntity>> fetchDishesFromCache() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> dishesEntity = dishesBox.values.toList();
    return dishesEntity;
  }

  ///Cart
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

  ///Settings
  Future<bool> getTheme() async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.get('isDark').toString() == 'true' ? true : false;
  }

  Future<void> setTheme(bool isDark) async {
    final Box themeBox = await Hive.openBox('theme');
    return themeBox.put('isDark', isDark.toString());
  }

  Future<double> getFontSize() async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.get('textScale');
  }

  Future<void> setFontSize(double textScale) async {
    final Box fontSizeBox = await Hive.openBox('fontSize');
    return fontSizeBox.put('textScale', textScale);
  }
}
