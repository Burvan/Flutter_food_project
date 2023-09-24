part of mappers;

class MapperFactory {
  DishesMapper get dishesMapper => DishesMapper();
  CartDishMapper get cartDishMapper => CartDishMapper();
  CartMapper get cartMapper => CartMapper();
  UserMapper get userMapper => UserMapper();
}
