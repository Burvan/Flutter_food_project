import 'package:domain/domain.dart';

class FetchCartDishesUseCase extends FutureUseCase<List<CartDish>, NoParams> {
  final CartRepository _cartRepository;

  FetchCartDishesUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<List<CartDish>> execute(NoParams params) async {
    return _cartRepository.fetchCartDishes();
  }
}
