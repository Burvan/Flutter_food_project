class Dish {
  final int id;
  final String category;
  final String imagePath;
  final double cost;
  final String name;
  final String description;
  final List<String>? ingredients;

  Dish({
    required this.id,
    required this.category,
    required this.imagePath,
    required this.cost,
    required this.name,
    required this.description,
    this.ingredients,
  });
}