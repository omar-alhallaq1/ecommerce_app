import 'package:dartz/dartz.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/categories_state.dart';
import 'package:ecommerce_app/core/features/home_screen/repo/home_repo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoriesCubit extends Cubit<CategoriesState> {
  CategoriesCubit(this._homeRepo)
    : super(
        CategoriesInitial(),
      ); //هذا هو "المُنشئ". وهو أول كود يعمل في اللحظة التي يطلب فيها تطبيقك إنشاء نسخة (Object) من هذا الكيوبت
  final HomeRepo _homeRepo;
  void fetchCategories() async {
    emit(CategoriesLoading()); //نقول للشاشة: إحنا بنحمل البيانات
    final Either<String, List<String>> res = await _homeRepo
        .getCategory(); //Repo نجيب البيانات
    // نفك الصندوق ونشوف النتيجة
    res.fold(
      // لو فشل: نبعت حالة الخطأ ونمرر رسالة الخطأ جواها
      (error) {
        emit(CategoriesError(error));
      }, //لو نجح: نبعت حالة النجاح ونمرر قائمة البيانات
      (right) {
        emit(CategoriesLoaded((right)));
      },
    );
  }
}
