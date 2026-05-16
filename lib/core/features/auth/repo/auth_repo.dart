import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/constans/constans.dart';
import 'package:ecommerce_app/core/features/auth/modles/login_response_modle.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';

class AuthRepo {
  Future<Either<String, LoginResponseModle>> login(
    String username,
    String password,
  ) async {
    try {
      final response = await DioHelper.postrequest(
        endpoint: AppConstants.login,
        data: {'username': username, 'password': password},
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        LoginResponseModle loginResponseModle = LoginResponseModle.fromJson(
          response.data,
        );
        return Right(loginResponseModle);
      } else {
        return Left(response.toString());
      }
    } catch (e) {
      if (e is DioException) {
        log(e.response.toString());
      }
      return Left(e.toString());
    }
  }
}
