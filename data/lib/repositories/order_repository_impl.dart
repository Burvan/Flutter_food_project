import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:data/mappers/mappers.dart';
import 'package:domain/domain.dart' as domain;

class OrderRepositoryImpl implements domain.OrderRepository {
  final OrderDataProvider _orderDataProvider;
  final HiveProvider _hiveProvider;

  OrderRepositoryImpl({
    required OrderDataProvider orderDataProvider,
    required HiveProvider hiveProvider,
  })  : _orderDataProvider = orderDataProvider,
        _hiveProvider = hiveProvider;

  @override
  Future<List<domain.Order>> fetchOrders(String userId) async {
    final List<OrderEntity> orders;
    final bool isInternetConnection =
        await InternetConnection.isInternetConnection();

    if (isInternetConnection) {
      orders = await _orderDataProvider.fetchOrders(userId);
      await _hiveProvider.saveOrdersToCache(orders);
    } else {
      orders = await _hiveProvider.fetchOrdersFromCache();
    }

    return orders
        .map((orderEntity) => OrderMapper.fromEntity(orderEntity))
        .toList();
  }

  @override
  Future<void> makeAnOrder(domain.Order order) async {
    final OrderEntity orderEntity = OrderMapper.toEntity(order);
    await _orderDataProvider.makeAnOrder(orderEntity);
    await _hiveProvider.addNewOrderToCache(OrderMapper.toEntity(order));
  }
}
