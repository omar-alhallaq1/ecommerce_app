import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class AdressItemWidget extends StatelessWidget {
  final String address;
  final String addressdetails;
  final bool isDefault;

  const AdressItemWidget({
    super.key,
    required this.address,
    required this.addressdetails,
    this.isDefault = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xffE6E6E6), width: 1.w),
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.location, height: 32.h, width: 32.w),
          Gap(16.w),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(
                      address,
                      style: AppStyles.black16boldstyle.copyWith(
                        fontSize: 18.sp,
                      ),
                    ),
                    if (isDefault) ...[
                      Gap(8.w),

                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 12.w,
                          vertical: 4.h,
                        ),
                        decoration: BoxDecoration(
                          color: const Color(0xffEEEEEE),
                          borderRadius: BorderRadius.circular(8.r),
                        ),
                        child: Text(
                          "Default",
                          style: AppStyles.black16boldstyle.copyWith(
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
                Gap(4.h),
                Text(
                  addressdetails,
                  style: AppStyles.gry12meduemstyle.copyWith(fontSize: 14.sp),
                  maxLines: 1,
                  overflow:
                      TextOverflow.ellipsis, // لإضافة "..." لو النص طويل جداً
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
