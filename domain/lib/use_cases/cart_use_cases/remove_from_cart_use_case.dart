import 'package:domain/domain.dart';

class RemoveFromCartUseCase extends FutureUseCase<void, CartDish> {
  final CartRepository _cartRepository;

  RemoveFromCartUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(CartDish cartDish) async {
    return _cartRepository.removeFromCart(cartDish);
  }
}
