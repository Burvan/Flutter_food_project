import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState.empty()) {
    on<AddToCartEvent>(_onAddDishToCart);
    on<RemoveFromCartEvent>(_onRemoveDishFromCart);
    on<ClearCartEvent>(_onClearCart);
  }

  Future<void> _onAddDishToCart(
    AddToCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> cartDishes = List.from(state.cart.cartDishes);
    bool isDishAlreadyInCart = false;
    for (int i = 0; i < cartDishes.length; i++) {
      final CartDish cartDish = cartDishes[i];
      if (cartDish.dish == event.dish) {
        cartDish.quantity += 1;
        isDishAlreadyInCart = true;
      }
    }
    if (!isDishAlreadyInCart) {
      cartDishes.add(
        CartDish(
          dish: event.dish,
          quantity: 1,
        ),
      );
    }
    final updatedTotalCost = state.cart.totalCost + event.dish.cost;
    emit(
      state.copyWith(
        cart: Cart(
          cartDishes: cartDishes,
          totalCost: updatedTotalCost,
        ),
      ),
    );
  }

  Future<void> _onRemoveDishFromCart(
    RemoveFromCartEvent event,
    Emitter<CartState> emit,
  ) async {
    final List<CartDish> cartDishes = List.from(state.cart.cartDishes);
    for (int i = 0; i < cartDishes.length; i++) {
      final CartDish cartDish = cartDishes[i];
      if (cartDish.dish == event.cartDish.dish && cartDish.quantity > 1) {
        cartDish.quantity -= 1;
      } else if (cartDish.dish == event.cartDish.dish &&
          cartDish.quantity == 1) {
        cartDishes.removeAt(i);
      }
    }
    final updatedTotalCost = state.cart.totalCost - event.cartDish.dish.cost;
    emit(
      state.copyWith(
        cart: Cart(
          cartDishes: cartDishes,
          totalCost: updatedTotalCost,
        ),
      ),
    );
  }

  Future<void> _onClearCart(
    ClearCartEvent event,
    Emitter<CartState> emit,
  ) async {
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
