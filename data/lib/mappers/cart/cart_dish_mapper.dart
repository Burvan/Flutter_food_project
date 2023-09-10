part of mappers;

class CartDishMapper extends Mapper<CartDishEntity, domain.CartDish> {
  @override
  domain.CartDish fromEntity(CartDishEntity entity) {
    return domain.CartDish(
      dish: domain.Dish(
        id: entity.dish.id,
        category: entity.dish.category,
        imagePath: entity.dish.imagePath,
        cost: entity.dish.cost,
        name: entity.dish.name,
        description: entity.dish.description,
      ),
      quantity: entity.quantity,
    );
  }

  @override
  CartDishEntity toEntity(domain.CartDish item) {
    return CartDishEntity(
      dish: DishEntity(
        id: item.dish.id,
        category: item.dish.category,
        imagePath: item.dish.imagePath,
        cost: item.dish.cost,
        name: item.dish.name,
        description: item.dish.description,
      ),
      quantity: item.quantity,
    );
  }
}
