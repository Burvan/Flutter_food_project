import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'main_page_event.dart';
part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final FetchDishesUseCase _fetchDishesUseCase;
  StreamSubscription<ConnectivityResult>? streamSubscription;

  MainPageBloc({
    required FetchDishesUseCase fetchDishesUseCase,
  })  : _fetchDishesUseCase = fetchDishesUseCase,
        super(
          MainPageState(
            dishes: const <Dish>[],
            currentDishes: const <Dish>[],
            isLoading: true,
            isInternetConnection: true,
          ),
        ) {
    on<InitEvent>(_onInit);
    on<FetchDishesEvent>(_onFetchDishes);
    on<ChangeCurrentDishesEvent>(_onChangeCurrentDishes);
    on<CheckInternetConnectionEvent>(_onCheckInternetConnection);

    add(const InitEvent());

    streamSubscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      add(const CheckInternetConnectionEvent());
    });
  }

  Future<void> _onInit(
    InitEvent event,
    Emitter<MainPageState> emit,
  ) async {
    add(const CheckInternetConnectionEvent());
    emit(
      state.copyWith(
        isLoading: true,
      ),
    );
    add(const FetchDishesEvent());
  }

  Future<void> _onFetchDishes(
    FetchDishesEvent event,
    Emitter<MainPageState> emit,
  ) async {
    final List<Dish> dishes = await _fetchDishesUseCase.execute(
      const NoParams(),
    );

    emit(
      state.copyWith(
        dishes: dishes,
      ),
    );
    add(ChangeCurrentDishesEvent(category: 'Donut'));
  }

  Future<void> _onChangeCurrentDishes(
    ChangeCurrentDishesEvent event,
    Emitter<MainPageState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    List<Dish> currentDishes = <Dish>[];
    for (int index = 0; index < state.dishes.length; index++) {
      if (state.dishes[index].category == event.category) {
        currentDishes.add(state.dishes[index]);
      }
    }
    emit(
      state.copyWith(
        currentDishes: currentDishes,
        isLoading: false,
      ),
    );
  }

  Future<void> _onCheckInternetConnection(
    CheckInternetConnectionEvent event,
    Emitter<MainPageState> emit,
  ) async {
    final bool isInternetConnection =
        await InternetConnection.isInternetConnection();
    emit(
      state.copyWith(isInternetConnection: isInternetConnection),
    );
  }
}
