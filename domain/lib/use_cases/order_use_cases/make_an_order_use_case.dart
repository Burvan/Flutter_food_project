import 'package:domain/domain.dart';
import 'package:domain/repositories/order_repository.dart';

class MakeAnOrderUseCase extends FutureUseCase<void, Order> {
  final OrderRepository _orderRepository;

  MakeAnOrderUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<void> execute(Order order) async {
    await _orderRepository.makeAnOrder(order);
  }
}
