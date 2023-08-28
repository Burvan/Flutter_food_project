part of mappers;

class CartMapper extends Mapper<CartEntity, domain.Cart> {
  @override
  domain.Cart fromEntity(CartEntity entity) {
    final cartDishes = entity.cartDishes
        .map((cartDish) => domain.CartDish(
            dish: domain.Dish(
              id: cartDish.dish.id,
              category: cartDish.dish.category,
              imagePath: cartDish.dish.imagePath,
              cost: cartDish.dish.cost,
              name: cartDish.dish.name,
              description: cartDish.dish.description,
            ),
            quantity: cartDish.quantity))
        .toList();
    return domain.Cart(
      totalCost: entity.totalCost,
      cartDishes: cartDishes,
    );
  }

  @override
  CartEntity toEntity(domain.Cart item) {
    final cartDishes = item.cartDishes
        .map((cartDish) => CartDishEntity(
        dish: DishEntity(
          id: cartDish.dish.id,
          category: cartDish.dish.category,
          imagePath: cartDish.dish.imagePath,
          cost: cartDish.dish.cost,
          name: cartDish.dish.name,
          description: cartDish.dish.description,
        ),
        quantity: cartDish.quantity))
        .toList();
    return CartEntity(
      cartDishes: cartDishes,
      totalCost: item.totalCost,
    );
  }
}
