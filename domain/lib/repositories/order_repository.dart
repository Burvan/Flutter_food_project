import 'package:domain/domain.dart';

abstract class OrderRepository {
  Future<void> makeAnOrder(Order order);
  Future<List<Order>> fetchOrders(String userId);
}