part of 'main_page_bloc.dart';

class MainPageState extends Equatable {
  final List<Dish> dishes;
  final List<Dish> currentDishes;
  final bool isLoading;

  MainPageState({
    required this.dishes,
    List<Dish>? currentDishes,
    required this.isLoading,
  }) : currentDishes = currentDishes ?? [];

  MainPageState copyWith({
    List<Dish>? dishes,
    List<Dish>? currentDishes,
    bool? isLoading,
  }) {
    return MainPageState(
      dishes: dishes ?? this.dishes,
      currentDishes: currentDishes ?? this.currentDishes,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  @override
  List<Object?> get props => <Object?>[
        dishes,
        currentDishes,
        isLoading,
      ];
}
