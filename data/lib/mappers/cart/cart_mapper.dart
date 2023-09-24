part of mappers;

abstract class CartMapper {
  static CartEntity toEntity(domain.Cart item) {
    final List<CartDishEntity> cartDishes = item.cartDishes
        .map((CartDish cartDish) => CartDishEntity(
              dish: DishesMapper.toEntity(cartDish.dish),
              quantity: cartDish.quantity,
            ))
        .toList();

    return CartEntity(
      cartDishes: cartDishes,
      totalCost: item.totalCost,
    );
  }

  static Cart fromEntity(CartEntity entity) {
    final cartDishes = entity.cartDishes
        .map((CartDishEntity cartDish) => CartDish(
              dish: DishesMapper.fromEntity(cartDish.dish),
              quantity: cartDish.quantity,
            ))
        .toList();

    return Cart(
      cartDishes: cartDishes,
      totalCost: entity.totalCost,
    );
  }
}
