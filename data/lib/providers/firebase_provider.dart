import 'package:core/core.dart';
import 'package:data/entities/dishes/dishes.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart' as domain;

class FirebaseProvider {
  final MapperFactory mapper;
  final CollectionReference collection =
      FirebaseFirestore.instance.collection('dishes');

  FirebaseProvider({
    required this.mapper,
  });

  Future<List<domain.Dish>> fetchDishes() async {
    final DocumentSnapshot documentSnapshot =
        await collection.doc('dishes').get();

    final Object? data = documentSnapshot.data();
    final List<domain.Dish> dishes = <domain.Dish>[];
    if (data != null && data is Map<String, dynamic>) {
      final List<dynamic> dishesFromMap = data['dishes'] as List<dynamic>;
      for (Map<String, dynamic> dish in dishesFromMap) {
        dishes.add(
          mapper.dishesMapper.fromEntity(
            DishEntity.fromJson(
              dish,
            ),
          ),
        );
      }
    }

    return dishes;
  }
}
