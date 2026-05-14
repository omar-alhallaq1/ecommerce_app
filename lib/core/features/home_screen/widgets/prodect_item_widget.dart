import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProdectItemWidget extends StatelessWidget {
  final String title;
  final String price;
  const ProdectItemWidget({
    super.key,
    required this.title,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      alignment: Alignment.center,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8.r),
            child: FlutterLogo(),
          ),

          Text(
            title, // متغير العنوان
            style: AppStyles.black18boldstyle,
          ),
          Gap(8.h),
          Text(
            price, // متغير السعر
            style: AppStyles.gry12meduemstyle,
          ),
        ],
      ),
    );
  }
}
