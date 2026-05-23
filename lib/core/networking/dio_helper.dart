import 'package:dio/dio.dart';
import 'package:ecommerce_app/core/networking/api_endpoints.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioHelper {
  Dio? dio;

  // 1. الـ Constructor: أول ما نستدعي الكلاس، بنجهز إعدادات الـ Dio الأساسية
  DioHelper() {
    dio ??= Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        receiveTimeout: const Duration(
          seconds: 20,
        ), // أقصى مدة للانتظار عشان ما يعلق التطبيق
        receiveDataWhenStatusError:
            true, // مهمة جداً: بتسمح للـ Dio يقرأ رسالة الخطأ اللي جاية من السيرفر (زي "الباسورد غلط")
      ),
    );

    // 2. الـ Logger: عينك السحرية في الكونسول لمراقبة شكل الطلب والرد
    dio!.interceptors.add(PrettyDioLogger());
  }

  // 3. دالة جلب البيانات (GET Request)
  Future<dynamic> getrequest({
    required String endpoint,
    Map<String, dynamic>?
    query, // (الرابط/البحث) هادي فلاتر بنضيفها على الرابط، مش البودي!
  }) async {
    try {
      final response = await dio!.get(endpoint, queryParameters: query);
      return response; // بنرجع الـ Response كامل للـ Repo
    } catch (e) {
      // الـ rethrow هنا ممتازة وبتخلي الـ AuthRepo يقدر يعمل if (error is DioException)
      rethrow;
    }
  }

  Future<dynamic> postrequest({
    required String endpoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data, // البودي (Body) اللي بنبعته للسيرفر
  }) async {
    try {
      final response = await dio!.post(
        endpoint,
        queryParameters: query,
        data: data,
      );
      return response;
    } catch (e) {
      // الـ rethrow هنا ممتازة وبتخلي الـ AuthRepo يقدر يعمل if (error is DioException)
      rethrow;
    }
  }

  Future<dynamic> putrequest({
    required String endpoint,
    Map<String, dynamic>? query,
    required Map<String, dynamic> data, // البودي (Body) اللي بنبعته للسيرفر
  }) async {
    try {
      final response = await dio!.put(
        endpoint,
        queryParameters: query,
        data: data,
      );
      return response;
    } catch (e) {
      // الـ rethrow هنا ممتازة وبتخلي الـ AuthRepo يقدر يعمل if (error is DioException)
      rethrow;
    }
  }
}
