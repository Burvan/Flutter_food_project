import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/entities/cart/cart_dish_entity.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/entities/user/user_entity.dart';

HiveBoxes hiveBoxes = HiveBoxes();

class HiveBoxes{
  Future<void> openBoxes() async {
    await Hive.openBox<UserEntity>(AppString.userBoxName);
    await Hive.openBox<DishEntity>(AppString.dishesBoxName);
    await Hive.openBox<CartDishEntity>(AppString.cartBoxName);
    await Hive.openBox<String>(AppString.themeBoxName);
    await Hive.openBox<double>(AppString.fontSizeBoxName);
  }
}