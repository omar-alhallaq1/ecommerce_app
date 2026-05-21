import 'package:ecommerce_app/core/features/home_screen/cubit/product_state.dart';
import 'package:ecommerce_app/core/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<ProductState> {
  ProductCubit(this._homeRepo) : super(ProductInitial());
  final HomeRepo _homeRepo;
  void featchProducts() async {
    emit(ProductLoading()); //نقول للشاشة: إحنا بنحمل البيانات
    final res = await _homeRepo.getProducts(); //Repo نجيب البيانات
    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }

  void featchProductsCategory(String catname) async {
    emit(ProductLoading());
    final res = await _homeRepo.getProductsCategory(
      catname,
    ); //Repo نجيب البيانات
    res.fold(
      (error) {
        emit(ProductError(error));
      },
      (right) {
        emit(ProductLoaded(right));
      },
    );
  }
}
