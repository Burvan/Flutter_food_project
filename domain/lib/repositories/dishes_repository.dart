import 'package:domain/models/dishes/dish.dart';
import 'package:domain/use_cases/use_case.dart';

abstract class DishesRepository {
  Future<List<Dish>> fetchDishes(NoParams payload);
}
