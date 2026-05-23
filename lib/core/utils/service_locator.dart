import 'package:ecommerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/core/features/auth/repo/auth_repo.dart';
import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/features/cart_screen/repo/cart_repo.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/repo/home_repo.dart';
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
  sl.registerLazySingleton(() => AuthRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => HomeRepo(sl<DioHelper>()));
  sl.registerLazySingleton(() => CartRepo(sl<DioHelper>()));

  //cubit
  sl.registerFactory(
    () => AuthCubit(sl<AuthRepo>()),
    // انشاء عند الاستدعاء او الحاجة
    // في كل مرة بتنده ع authcubit بروح بيعمل منها انسانس جديد
  );
  sl.registerFactory(() => ProductCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CategoriesCubit(sl<HomeRepo>()));
  sl.registerFactory(() => CartCubit(sl<CartRepo>()));
}
