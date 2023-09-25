import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/mappers.dart';
import 'package:core_ui/core_ui.dart';
import 'package:domain/domain.dart' as domain;

class HiveProvider {
  final Box<UserEntity> userBox;
  final Box<CartDishEntity> cartBox;
  final Box<DishEntity> dishBox;
  final Box<String> themeBox;
  final Box<double> fontSizeBox;
  final Box<OrderEntity> orderBox;

  HiveProvider({
    required this.userBox,
    required this.dishBox,
    required this.cartBox,
    required this.themeBox,
    required this.fontSizeBox,
    required this.orderBox,
  });

  ///Auth
  Future<void> saveUser(domain.AppUser user) async {
    final UserEntity userEntity = UserMapper.toEntity(user);
    await userBox.add(userEntity);
  }

  Future<void> deleteUser() async {
    await userBox.clear();
  }

  Future<UserEntity> getUser() async {
    return userBox.isNotEmpty
        ? userBox.values.first
        : UserEntity(
            id: '',
            name: '',
            email: '',
          );
  }

  ///Home
  Future<void> saveDishesToCache(List<DishEntity> dishesEntity) async {
    if (dishBox.isEmpty) {
      await dishBox.addAll(dishesEntity);
    }
  }

  Future<List<DishEntity>> fetchDishesFromCache() async {
    final List<DishEntity> dishesEntity = dishBox.values.toList();
    return dishesEntity;
  }

  ///Cart
  Future<void> addToCart(DishEntity dish) async {
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
    if (cartDishEntity.quantity > 1) {
      cartDishEntity.quantity -= 1;
      cartBox.put(cartDishEntity.dish.name, cartDishEntity);
    } else {
      cartBox.delete(cartDishEntity.dish.name);
    }
  }

  Future<void> clearCart() async {
    cartBox.clear();
  }

  Future<List<CartDishEntity>> getCartDishes() async {
    final List<CartDishEntity> cartDishesEntity = cartBox.values.toList();
    return cartDishesEntity;
  }

  ///Settings
  Future<bool> getTheme() async {
    return themeBox.get(AppString.themeKey).toString() == 'true' ? true : false;
  }

  Future<void> setTheme(bool isDark) async {
    return themeBox.put(AppString.themeKey, isDark.toString());
  }

  Future<double> getFontSize() async {
    return fontSizeBox.get(AppString.fontSizeKey) ?? 1;
  }

  Future<void> setFontSize(double textScale) async {
    return fontSizeBox.put(AppString.fontSizeKey, textScale);
  }

  ///Order history
  Future<void> saveOrdersToCache(List<OrderEntity> orders) async {
    await orderBox.clear();
    await orderBox.addAll(orders);
  }

  Future<List<OrderEntity>> fetchOrdersFromCache() async {
    final List<OrderEntity> orders = orderBox.values.toList();
    return orders;
  }

  Future<void> addNewOrderToCache(OrderEntity order) async {
    await orderBox.add(order);
  }
}
