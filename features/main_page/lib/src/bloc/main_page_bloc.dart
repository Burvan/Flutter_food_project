import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'main_page_event.dart';

part 'main_page_state.dart';

class MainPageBloc extends Bloc<MainPageEvent, MainPageState> {
  final FetchDishesUseCase _fetchDishesUseCase;

  MainPageBloc({
    required FetchDishesUseCase fetchDishesUseCase,
  })  : _fetchDishesUseCase = fetchDishesUseCase,
        super(
          MainPageState(
            dishes: const <Dish>[],
            currentDishes: const <Dish>[],
            isLoading: true,
          ),
        ) {
    on<InitEvent>(_onInit);
    on<FetchDishes>(_onFetchDishes);
    on<ChangeCurrentDishes>(_onChangeCurrentDishes);

    add(const InitEvent());
  }

  void _onInit(
    InitEvent event,
    Emitter<MainPageState> emit,
  ) {
    emit(state.copyWith(isLoading: true));
    add(const FetchDishes());
  }

  Future<void> _onFetchDishes(
    FetchDishes event,
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
    add(ChangeCurrentDishes(category: 'Donut'));
  }

  Future<void> _onChangeCurrentDishes(
    ChangeCurrentDishes event,
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
}
