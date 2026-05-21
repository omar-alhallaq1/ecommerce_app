import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';

abstract class ProductState {}

class ProductInitial extends ProductState {}

class ProductLoading extends ProductState {}

class ProductLoaded extends ProductState {
  List<ProductModel> products;
  ProductLoaded(this.products);
}

class ProductError extends ProductState {
  final String massage;
  ProductError(this.massage);
}
