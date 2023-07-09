import 'package:data/providers/firebase_provider.dart';
import 'package:domain/domain.dart' as domain;

class DishesRepositoryImpl implements domain.DishesRepository {
  final FirebaseProvider _firebaseProvider;

  DishesRepositoryImpl({required FirebaseProvider firebaseProvider})
      : _firebaseProvider = firebaseProvider;

  @override
  Future<List<domain.Dish>> fetchDishes(domain.NoParams payload) async {
    return await _firebaseProvider.fetchDishes();
  }
}
