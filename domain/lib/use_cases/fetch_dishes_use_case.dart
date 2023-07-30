import 'package:domain/models/dishes/dish.dart';
import 'package:domain/repositories/dishes_repository.dart';
import 'package:domain/use_cases/use_case.dart';

class FetchDishesUseCase extends FutureUseCase<List<Dish>, NoParams> {
  final DishesRepository _dishRepository;

  FetchDishesUseCase({
    required DishesRepository dishRepository,
  }) : _dishRepository = dishRepository;

  @override
  Future<List<Dish>> execute(NoParams params) async {
    return _dishRepository.fetchDishes(params);
  }
}
