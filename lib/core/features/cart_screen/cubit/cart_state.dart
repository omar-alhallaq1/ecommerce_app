import 'package:ecommerce_app/core/features/cart_screen/model/cart_model.dart';

abstract class CartState {}

class LoadingCarts extends CartState {}

class InitialCartState extends CartState {}

class SuccessCarts extends CartState {
  final CartModel cart;
  SuccessCarts(this.cart);
}

class ErrorGettingCarts extends CartState {
  final String massage;
  ErrorGettingCarts(this.massage);
}
////////////////////////////////////////// Adding to cart states

class AddingToCart extends CartState {}

class SuccessAddingToCart extends CartState {
  final CartModel cart;
  SuccessAddingToCart(this.cart);
}

class ErrorAddingToCart extends CartState {
  final String massage;
  ErrorAddingToCart(this.massage);
}
