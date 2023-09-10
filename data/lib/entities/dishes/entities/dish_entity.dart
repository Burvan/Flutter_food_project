import 'package:core/core.dart';
part 'dish_entity.g.dart';

@HiveType(typeId: 2)
class DishEntity {
  @HiveField(0)
  final int id;

  @HiveField(1)
  final String category;

  @HiveField(2)
  final String imagePath;

  @HiveField(3)
  final double cost;

  @HiveField(4)
  final String name;

  @HiveField(5)
  final String description;

  @HiveField(6)
  final List<String>? ingredients;

  DishEntity({
    required this.id,
    required this.category,
    required this.imagePath,
    required this.cost,
    required this.name,
    required this.description,
    this.ingredients,
  });

  factory DishEntity.fromJson(Map<String, dynamic> json){
    return DishEntity(
      name: json['name'] as String,
      category: json['category'] as String,
      cost: (json['cost'] as num).toDouble(),
      description: json['description'] as String,
      id: json['id'] as int,
      imagePath: json['imagePath'] as String,
      ingredients: List<String>.from(json['ingredients'] ?? []),
    );
  }
}