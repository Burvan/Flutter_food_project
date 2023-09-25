import 'package:domain/domain.dart';

class FetchOrdersUseCase extends FutureUseCase<List<Order>, String> {
  final OrderRepository _orderRepository;

  FetchOrdersUseCase({
    required OrderRepository orderRepository,
  }) : _orderRepository = orderRepository;

  @override
  Future<List<Order>> execute(String userId) {
    return _orderRepository.fetchOrders(userId);
  }
}
