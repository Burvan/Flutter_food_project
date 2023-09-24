part of mappers;

abstract class CartDishMapper {
  static CartDishEntity toEntity(domain.CartDish item) {
    return CartDishEntity(
      quantity: item.quantity,
      dish: DishesMapper.toEntity(item.dish),
    );
  }

  static domain.CartDish fromEntity(CartDishEntity entity) {
    return domain.CartDish(
      quantity: entity.quantity,
      dish: DishesMapper.fromEntity(entity.dish),
    );
  }
}

