abstract class CategoriesState {} // الكيوبت برمجياً يرفض التعامل مع أنواع كثيرة. الكلاس الأب يجمع كل هذه الحالات تحت "اسم واحد" لكي يقبلها الكيوبت

class CategoriesInitial extends CategoriesState {}

class CategoriesLoading extends CategoriesState {}

class CategoriesLoaded extends CategoriesState {
  final List<String> categories;
  CategoriesLoaded(this.categories);
}

class CategoriesError extends CategoriesState {
  final String error;
  CategoriesError(this.error);
}
