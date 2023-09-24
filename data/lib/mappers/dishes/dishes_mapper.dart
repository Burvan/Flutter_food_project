part of mappers;

abstract class DishesMapper {
  static DishEntity toEntity(domain.Dish item) {
    return DishEntity(
      id: item.id,
      category: item.category,
      imagePath: item.imagePath,
      cost: item.cost,
      name: item.name,
      description: item.description,
      ingredients: item.ingredients,
    );
  }

  static domain.Dish fromEntity(DishEntity entity) {
    return domain.Dish(
      id: entity.id,
      category: entity.category,
      imagePath: entity.imagePath,
      cost: entity.cost,
      name: entity.name,
      description: entity.description,
      ingredients: entity.ingredients,
    );
  }
}
