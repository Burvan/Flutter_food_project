import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final FetchCartDishesUseCase _fetchCartDishesUseCase;
  final AddToCartUseCase _addToCartUseCase;
  final RemoveFromCartUseCase _removeFromCartUseCase;
  final ClearCartUseCase _clearCartUseCase;

  CartBloc({
    required FetchCartDishesUseCase fetchCartDishesUseCase,
    required AddToCartUseCase addToCartUseCase,
    required RemoveFromCartUseCase removeFromCartUseCase,
    required ClearCartUseCase clearCartUseCase,
  })  : _fetchCartDishesUseCase = fetchCartDishesUseCase,
        _addToCartUseCase = addToCartUseCase,
        _removeFromCartUseCase = removeFromCartUseCase,
        _clearCartUseCase = clearCartUseCase,
        super(CartState.empty()) {
    on<InitCartEvent>(_onInitCart);
    on<AddToCartEvent>(_onAddDishToCart);
    on<RemoveFromCartEvent>(_onRemoveDishFromCart);
    on<ClearCartEvent>(_onClearCart);

    add(const InitCartEvent());
  }

  Future<void> _onInitCart(
    InitCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> cartDishes = await _fetchCartDishesUseCase.execute(
      const NoParams(),
    );
    if (cartDishes.isEmpty) {
      emit(state.copyWith(cart: state.cart));
    } else {
      double totalCost = 0;
      for (final dish in cartDishes) {
        totalCost += dish.dish.cost * dish.quantity;
      }
      emit(
        state.copyWith(
          cart: Cart(
            cartDishes: cartDishes,
            totalCost: totalCost,
          ),
        ),
      );
    }
  }

  Future<void> _onAddDishToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _addToCartUseCase.execute(event.dish);
    final List<CartDish> cartDishes = await _fetchCartDishesUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        cart: Cart(
          cartDishes: cartDishes,
          totalCost: state.cart.totalCost + event.dish.cost,
        ),
      ),
    );
  }

  Future<void> _onRemoveDishFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _removeFromCartUseCase.execute(event.cartDish);
    final List<CartDish> cartDishes = await _fetchCartDishesUseCase.execute(
      const NoParams(),
    );
    emit(
      state.copyWith(
        cart: Cart(
          cartDishes: cartDishes,
          totalCost: state.cart.totalCost - event.cartDish.dish.cost,
        ),
      ),
    );
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
    await _clearCartUseCase.execute(const NoParams());
    emit(
      state.copyWith(
        cart: const Cart(
          cartDishes: [],
          totalCost: 0,
        ),
      ),
    );
  }
}
