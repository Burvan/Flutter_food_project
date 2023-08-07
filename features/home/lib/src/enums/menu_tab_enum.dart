enum MenuTabType {
  donut,
  cake,
  sandwich,
  drink,
}

extension MenuTabTypeExtension on MenuTabType {
  String get categoryName {
    switch (this) {
      case MenuTabType.donut:
        return 'Donut';
      case MenuTabType.cake:
        return 'Cake';
      case MenuTabType.sandwich:
        return 'Sandwich';
      case MenuTabType.drink:
        return 'Drink';
    }
  }

  String get imagePath {
    switch (this) {
      case MenuTabType.donut:
        return 'assets/donut_tab.png';
      case MenuTabType.cake:
        return 'assets/cake_tab.png';
      case MenuTabType.sandwich:
        return 'assets/sandwich_tab.png';
      case MenuTabType.drink:
        return 'assets/drinks_tab.png';
    }
  }
}
