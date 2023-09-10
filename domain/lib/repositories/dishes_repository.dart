import 'package:domain/models/dishes/dish.dart';

abstract class DishesRepository {
  Future<List<Dish>> fetchDishes();
}
