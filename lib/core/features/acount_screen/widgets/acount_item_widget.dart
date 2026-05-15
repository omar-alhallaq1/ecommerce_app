import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AcountItemWidget extends StatelessWidget {
  final String title;
  final String? icon;
  final Function()? onTap;
  const AcountItemWidget({
    super.key,
    required this.title,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16).w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InkWell(
            onTap: onTap,
            child: Row(
              children: [
                // إذا كانت الايقونة موجودة ارسمها، إذا لا حط ويدجت بديل (مثلاً دائرة أو أيقونة افتراضية)
                icon != null && icon!.isNotEmpty
                    ? SvgPicture.asset(icon!, height: 24.h, width: 24.w)
                    : Icon(Icons.person, size: 24.h),
                Gap(16.w),
                Text(
                  title,
                  style: AppStyles.black16w500style.copyWith(fontSize: 24.sp),
                ),
              ],
            ),
          ),
          SvgPicture.asset(AppAssets.chevron, height: 24.h, width: 24.w),
        ],
      ),
    );
  }
}
