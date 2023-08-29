import 'package:domain/domain.dart';

class AddToCartUseCase extends FutureUseCase<void, Dish> {
  final CartRepository _cartRepository;

  AddToCartUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(Dish dish) async {
    return _cartRepository.addToCart(dish);
  }
}
