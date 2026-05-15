import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitlePriceWidget extends StatelessWidget {
  final String title;
  final String price;
  const TitlePriceWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.gry12meduemstyle.copyWith(fontSize: 16.sp),
        ),
        const Spacer(),
        Text(price, style: AppStyles.black16boldstyle),
      ],
    );
  }
}
