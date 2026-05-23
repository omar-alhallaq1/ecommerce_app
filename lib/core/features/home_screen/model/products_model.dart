class ProductModel {
  final int? id;
  final String? title;
  final double? price;
  final String? description;
  final String? category;
  final String? image;
  final Rating? rating;

  ProductModel({
    this.id,
    this.title,
    this.price,
    this.description,
    this.category,
    this.image,
    this.rating,
  });

  // دالة تحويل الـ JSON لكائن (Object)
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      // 🛡️ حماية ذكية: أحياناً السيرفر بيرجع السعر 20 بدل 20.0، فهاد السطر بيحميك من الكراش
      price: json['price']?.toDouble(),
      description: json['description'],
      category: json['category'], // بناخذ اسم القسم كنص مباشر
      image: json['image'],
      // لو التقييم مش موجود، رجع نل، غير هيك استدعي موديل التقييم
      rating: json['rating'] != null ? Rating.fromJson(json['rating']) : null,
    );
  }
}

class Rating {
  final double? rate;
  final int? count;

  Rating({this.rate, this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      // نفس الحماية تبعت السعر عشان الـ rate
      rate: json['rate']?.toDouble(),
      count: json['count'],
    );
  }
}
