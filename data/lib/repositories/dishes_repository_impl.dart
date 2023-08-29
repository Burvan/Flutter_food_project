import 'package:core/core.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
import 'package:domain/domain.dart' as domain;
import 'package:domain/domain.dart';

class DishesRepositoryImpl implements domain.DishesRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;
  final MapperFactory mapper;

  DishesRepositoryImpl({
    required this.mapper,
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<domain.Dish>> fetchDishes(domain.NoParams payload) async {
    final List<Dish> dishes;
    if (await InternetConnection.isInternetConnection()) {
      dishes = await _firebaseProvider.fetchDishes();
      await _hiveProvider.saveDishesToCache(dishes);
    } else {
      final List<DishEntity> cacheDishes =
          await _hiveProvider.fetchDishesFromCache();
      dishes = cacheDishes
          .map((DishEntity dish) => mapper.dishesMapper.fromEntity(dish))
          .toList();
    }
    return dishes;
  }
}
