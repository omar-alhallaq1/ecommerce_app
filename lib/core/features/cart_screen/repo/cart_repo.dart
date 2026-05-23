import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/features/cart_screen/model/cart_model.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';

class CartRepo {
  final DioHelper dioHelper;

  CartRepo(this.dioHelper);
  Future<Either<String, CartModel>> getUserCart() async {
    try {
      final response = await dioHelper.getrequest(
        endpoint: "${ApiEndpoints.carts}/user/2",
      );
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data[0]);
        return Right(cartModel);
      } else {
        return const Left("Failed to fetch cart data. Status code");
      }
    } catch (e) {
      return Left(e.toString());
    }
  }

  Future<Either<String, CartModel>> addtoCart({
    required String date,
    required ProductModel product,
    required int quantity,
  }) async {
    try {
      final response = await dioHelper.putrequest(
        endpoint: "${ApiEndpoints.carts}/3",
        data: {
          "userId": 2,
          "date": date,
          "products": [
            {"productId": product.id, "quantity": quantity},
          ],
        },
      );
      if (response.statusCode == 200) {
        CartModel cartModel = CartModel.fromJson(response.data);
        return Right(cartModel);
      } else {
        return const Left("Failed to fetch cart data. Status code");
      }
    } catch (e) {
      print(e.toString());
      return Left(e.toString());
    }
  }
}
