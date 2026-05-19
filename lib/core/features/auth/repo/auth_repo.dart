import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/features/auth/modles/login_response_modle.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helpar.dart';

class AuthRepo {
  final DioHelper _dioHelper;

  AuthRepo(this._dioHelper);

  Future<Either<String, LoginResponseModle>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await _dioHelper.postrequest(
        endpoint: ApiEndpoints.login,
        data: {'username': username, 'password': password},
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        // تأكد إذا دالة postrequest بترجع الـ response.data أو الـ response بالكامل
        // لو مبرمجة ترجع الـ data علطول، شيل كلمة .data وخليها (response) بس
        final Map<String, dynamic> responseData = response is Response
            ? response.data
            : response;

        LoginResponseModle loginResponseModle = LoginResponseModle.fromJson(
          responseData,
        );

        // ✅ التصليح الجوهري: فحص إن التوكن موجود وسليم (مش نل)
        if (loginResponseModle.token != null &&
            loginResponseModle.token!.isNotEmpty) {
          // الحين التوكن آمن مية بالمية نخزنه كاش
          await sl<StorageHelpar>().saveToken(token: loginResponseModle.token!);
          return Right(loginResponseModle);
        } else {
          // لو السيرفر رجع استجابة ناجحة بس الجيسون ما جواه توكن
          return const Left("فشل في لقط التوكن من السيرفر ❌");
        }
      } else {
        return Left(response.toString());
      }
    } catch (error) {
      if (error is DioException) {
        return Left(error.response?.toString() ?? "حصل خطأ في الشبكة");
      }
      return Left(error.toString());
    }
  }
}
