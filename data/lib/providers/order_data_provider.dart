import 'package:core/core.dart';
import 'package:core_ui/core_ui.dart';
import 'package:data/data.dart';

class OrderDataProvider {
  Future<void> makeAnOrder(OrderEntity orderEntity) async {
    final CollectionReference collection = FirebaseFirestore.instance
        .collection(AppString.userCollection)
        .doc(orderEntity.id)
        .collection(AppString.orderCollection);

    await collection.doc().set({orderEntity.toJson()});
  }

  Future<List<OrderEntity>> fetchOrders(String userId) async {
    final List<QueryDocumentSnapshot<Map<String, dynamic>>> orders =
        (await FirebaseFirestore.instance
                .collection(AppString.userCollection)
                .doc(userId)
                .collection(AppString.orderCollection)
                .get())
            .docs;

    return orders
        .map(
          (QueryDocumentSnapshot<Map<String, dynamic>> order) =>
              OrderEntity.fromJson(order.data()),
        )
        .toList();
  }
}
