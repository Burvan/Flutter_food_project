part of 'main_page_bloc.dart';

abstract class MainPageEvent {
  const MainPageEvent();
}

class InitEvent extends MainPageEvent {
  const InitEvent();
}

class FetchDishes extends MainPageEvent {
  const FetchDishes();
}

class ChangeCurrentDishes extends MainPageEvent {
  final String category;

  ChangeCurrentDishes({
    required this.category,
  });
}
