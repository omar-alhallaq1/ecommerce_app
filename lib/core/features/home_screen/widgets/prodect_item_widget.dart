import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProdectItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final Function() onTap;
  const ProdectItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: SizedBox(
                width: 161.w,
                height: 174.h,
                child: Container(color: Colors.grey),
              ),
            ),

            Text(title, style: AppStyles.black18boldstyle),
            Gap(8.h),
            Text(price, style: AppStyles.gry12meduemstyle),
          ],
        ),
      ),
    );
  }
}
