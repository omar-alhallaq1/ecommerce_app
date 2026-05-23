import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/core/features/cart_screen/repo/cart_repo.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit(this._cartRepo) : super(InitialCartState());
  final CartRepo _cartRepo;
  void fetchCarts() async {
    emit(LoadingCarts());
    final res = await _cartRepo.getUserCart();
    res.fold(
      (error) => emit(ErrorGettingCarts(error.toString())),
      (right) => emit(SuccessCarts(right)),
    );
  }

  void addToCart({
    required String date,
    required ProductModel product,
    required int quantity,
  }) async {
    emit(AddingToCart());
    DateTime date = DateTime.now();
    final res = await _cartRepo.addtoCart(
      date: date.toString(),
      product: product,
      quantity: quantity,
    );
    res.fold(
      (error) => emit(ErrorAddingToCart(error.toString())),
      (right) => emit(SuccessAddingToCart(right)),
    );
  }
}
