import 'package:domain/domain.dart';

class ClearCartUseCase extends FutureUseCase<void, NoParams> {
  final CartRepository _cartRepository;

  ClearCartUseCase({required CartRepository cartRepository})
      : _cartRepository = cartRepository;

  @override
  Future<void> execute(NoParams params) {
    return _cartRepository.clearCart(params);
  }
}
