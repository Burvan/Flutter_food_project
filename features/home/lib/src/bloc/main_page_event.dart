part of 'main_page_bloc.dart';

abstract class MainPageEvent {
  const MainPageEvent();
}

class InitEvent extends MainPageEvent {
  const InitEvent();
}

class FetchDishesEvent extends MainPageEvent {
  const FetchDishesEvent();
}

class ChangeCurrentDishesEvent extends MainPageEvent {
  final String category;

  ChangeCurrentDishesEvent({
    required this.category,
  });
}

class CheckInternetConnectionEvent extends MainPageEvent {
  const CheckInternetConnectionEvent();
}
