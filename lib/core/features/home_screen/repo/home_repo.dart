import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';

class HomeRepo {
  final DioHelper _dioHelper;

  HomeRepo(this._dioHelper);

  Future<Either<String, List<ProductModel>>> getProducts() async {
    try {
      final response = await _dioHelper.getrequest(
        endpoint: ApiEndpoints.products,
      );

      if (response.statusCode == 200) {
        // 1. نستقبل البيانات كقائمة
        final List<dynamic> responseData = response.data;
        // 2. نحولها إلى قائمة منتجات
        List<ProductModel> products = responseData
            .map((product) => ProductModel.fromJson(product))
            .toList(); // هنا بناخد البيانات الي جاية من السيرفر وبنبعتها تترجم في المودل
        // 3. نرجع النجاح
        return Right(products);
      } else {
        return Left("Failed to fetch products");
      }
    } catch (error) {
      return Left(error.toString());
    }
  }

  Future<Either<String, List<ProductModel>>> getProductsCategory(
    String catname,
  ) async {
    try {
      final response = await _dioHelper.getrequest(
        endpoint: ApiEndpoints.products + "/$catname",
      );

      if (response.statusCode == 200) {
        // 1. نستقبل البيانات كقائمة
        final List<dynamic> responseData = response.data;
        // 2. نحولها إلى قائمة منتجات
        List<ProductModel> products = responseData
            .map((product) => ProductModel.fromJson(product))
            .toList();
        // 3. نرجع النجاح
        return Right(products);
      } else {
        return Left("Failed to fetch products");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, List<String>>> getCategory() async {
    try {
      final response = await _dioHelper.getrequest(
        endpoint: ApiEndpoints.categories,
      );

      if (response.statusCode == 200) {
        // 1. نستقبل البيانات كقائمة
        List<String> categories = List<String>.from(response.data);

        // 3. نرجع النجاح
        return Right(categories);
      } else {
        return Left("Failed to fetch categories");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }
}
