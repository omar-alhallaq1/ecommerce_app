import 'package:ecommerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();
  sl.registerSingleton(dio); // انشاء فوري قي الذاكرة
  sl.registerSingleton<AuthRepo>(
    AuthRepo(sl()),
  ); // انشاء عند الاستدعاء او الحاجة
}
