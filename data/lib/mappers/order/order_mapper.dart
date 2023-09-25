part of mappers;

abstract class OrderMapper {
  static OrderEntity toEntity(Order order) {
    return OrderEntity(
        id: order.id,
        dateTime: order.dateTime,
        cartEntity: CartMapper.toEntity(order.cart),
    );
  }

  static Order fromEntity(OrderEntity entity) {
    return Order(
        id: entity.id,
        dateTime: entity.dateTime,
        cart: CartMapper.fromEntity(entity.cartEntity),
    );
  }
}