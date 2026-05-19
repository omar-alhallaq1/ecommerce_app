import 'package:ecommerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/core/networking/dio_helper.dart';
import 'package:ecommerce_app/core/utils/storage_helpar.dart';
import 'package:get_it/get_it.dart';

GetIt sl = GetIt.instance;

void setupServiceLocator() {
  DioHelper dio = DioHelper();
  //DioHelper
  sl.registerSingleton(dio);
  // Storage Helpar
  sl.registerLazySingleton(() => StorageHelpar());

  //Repo// انشاء فوري قي الذاكرة
  sl.registerSingleton(AuthRepo(sl<DioHelper>()));
  //cubit
  sl.registerFactory(
    () => AuthCubit(sl<AuthRepo>()), // انشاء عند الاستدعاء او الحاجة
  ); // في كل مرة بتنده ع authcubit بروح بيعمل منها انسانس جديد
}
