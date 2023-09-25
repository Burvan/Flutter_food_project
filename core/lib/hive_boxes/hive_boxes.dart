import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';

HiveBoxes hiveBoxes = HiveBoxes();

class HiveBoxes{
  Future<void> openBoxes() async {
    await Hive.openBox<UserEntity>(AppString.userBoxName);
    await Hive.openBox<DishEntity>(AppString.dishesBoxName);
    await Hive.openBox<CartDishEntity>(AppString.cartBoxName);
    await Hive.openBox<String>(AppString.themeBoxName);
    await Hive.openBox<double>(AppString.fontSizeBoxName);
    await Hive.openBox<OrderEntity>(AppString.orderBoxName);
  }
}