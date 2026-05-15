import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TotalPriceWidget extends StatelessWidget {
  final String title;
  final String price;
  const TotalPriceWidget({super.key, required this.title, required this.price});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: AppStyles.black16boldstyle.copyWith(fontSize: 16.sp),
        ),
        const Spacer(),
        Text(price, style: AppStyles.black16boldstyle),
      ],
    );
  }
}
