import 'package:core/core.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart';

class HiveProvider {
  final MapperFactory mapper;

  HiveProvider({required this.mapper});

  Future<void> saveDishesToCache(List<Dish> dishes) async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    if (dishesBox.isEmpty) {
      final List<DishEntity> dishesEntity = dishes
          .map((Dish dish) => mapper.dishesMapper.toEntity(dish))
          .toList();
      await dishesBox.addAll(dishesEntity);
    }
  }

  Future<List<DishEntity>> fetchDishesFromCache() async {
    final Box<DishEntity> dishesBox = await Hive.openBox('dishes');
    final List<DishEntity> dishesEntity = dishesBox.values.toList();
    return dishesEntity;
  }
}
