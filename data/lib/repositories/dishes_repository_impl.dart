import 'package:core/core.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';
import 'package:data/mappers/mappers.dart';
import 'package:data/providers/firebase_provider.dart';
import 'package:data/providers/hive_provider.dart';
import 'package:domain/domain.dart' as domain;

class DishesRepositoryImpl implements domain.DishesRepository {
  final FirebaseProvider _firebaseProvider;
  final HiveProvider _hiveProvider;

  DishesRepositoryImpl({
    required FirebaseProvider firebaseProvider,
    required HiveProvider hiveProvider,
  })  : _firebaseProvider = firebaseProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<domain.Dish>> fetchDishes() async {
    final List<DishEntity> dishesEntity;
    final bool isInternetConnection =
    await InternetConnection.isInternetConnection();

    if (isInternetConnection) {
      dishesEntity = (await _firebaseProvider.fetchDishes())!;
      await _hiveProvider.saveDishesToCache(dishesEntity);
    } else {
      final List<DishEntity> cacheDishes =
      await _hiveProvider.fetchDishesFromCache();
      dishesEntity = cacheDishes;
    }
    return dishesEntity
        .map((DishEntity dishEntity) => DishesMapper.fromEntity(dishEntity))
        .toList();
  }
}
