part of mappers;

class DishesMapper extends Mapper<DishEntity, domain.Dish> {
  @override
  domain.Dish fromEntity(DishEntity entity) {
    return domain.Dish(
      id: entity.id,
      category: entity.category,
      imagePath: entity.imagePath,
      cost: entity.cost,
      name: entity.name,
      description: entity.description,
    );
  }

  @override
  DishEntity toEntity(domain.Dish item) {
    return DishEntity(
      id: item.id,
      category: item.category,
      imagePath: item.imagePath,
      cost: item.cost,
      name: item.name,
      description: item.description,
    );
  }
}
