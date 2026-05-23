import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CategoryItemWidget extends StatelessWidget {
  final String categoryName;
  final VoidCallback? onTap;
  final bool isSelected;
  const CategoryItemWidget({
    super.key,
    required this.categoryName,
    this.onTap,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap ?? () {},
      child: Padding(
        padding: EdgeInsetsDirectional.only(end: 8.w),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primarycolor : Colors.white,
            border: isSelected
                ? null
                : Border.all(color: Colors.grey, width: 0.5.w),
            borderRadius: BorderRadius.circular(8.w),
          ),
          child: Text(
            categoryName,
            style: AppStyles.black18boldstyle.copyWith(
              color: isSelected ? Colors.white : AppColors.blackcolor,
            ),
          ),
        ),
      ),
    );
  }
}
