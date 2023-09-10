part of mappers;

class CartMapper extends Mapper<CartEntity, domain.Cart> {
  @override
  domain.Cart fromEntity(CartEntity entity) {
    final List<CartDish> cartDishes = entity.cartDishes
        .map(
          (CartDishEntity cartDish) => domain.CartDish(
              dish: domain.Dish(
                id: cartDish.dish.id,
                category: cartDish.dish.category,
                imagePath: cartDish.dish.imagePath,
                cost: cartDish.dish.cost,
                name: cartDish.dish.name,
                description: cartDish.dish.description,
              ),
              quantity: cartDish.quantity),
        )
        .toList();
    return domain.Cart(
      totalCost: entity.totalCost,
      cartDishes: cartDishes,
    );
  }

  @override
  CartEntity toEntity(domain.Cart item) {
    final List<CartDishEntity> cartDishes = item.cartDishes
        .map((CartDish cartDish) => CartDishEntity(
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
