part of dish_entity;

class DishEntity {
  final int id;
  final String category;
  final String imagePath;
  final double cost;
  final String name;
  final String description;

  DishEntity({
    required this.id,
    required this.category,
    required this.imagePath,
    required this.cost,
    required this.name,
    required this.description,
  });

  factory DishEntity.fromJson(Map<String, dynamic> json){
    return DishEntity(
      name: json['name'] as String,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
      description: json['description'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
    );
  }
}