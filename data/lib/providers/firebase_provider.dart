import 'package:core/core.dart';
import 'package:data/entities/dishes/entities/dish_entity.dart';

class FirebaseProvider {
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('dishes');

  Future<List<DishEntity>?> fetchDishes() async {
    final DocumentSnapshot documentSnapshot =
        await collection.doc('dishes').get();

    final Map<String, dynamic>? data =
        documentSnapshot.data() as Map<String, dynamic>?;
    final List<DishEntity> dishesEntity = <DishEntity>[];
    if (data != null && data.containsKey('dishes')) {
      final List<dynamic> dishesFromMap = data['dishes'] as List<dynamic>;
      for (Map<String, dynamic> dishData in dishesFromMap) {
        final DishEntity dishEntity = DishEntity.fromJson(dishData);
        dishesEntity.add(dishEntity);
      }
      return dishesEntity;
    }
    return null;
  }
}
