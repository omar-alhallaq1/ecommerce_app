import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductDitailsScreen extends StatelessWidget {
  const ProductDitailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Details'),
        centerTitle: true,
        backgroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20.h),
                  Container(
                    width: 350.w,
                    height: 363.h,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    "Fit Polo T Shirt",
                    style: AppStyles.black18boldstyle.copyWith(fontSize: 24.sp),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFA928), size: 18.sp),
                      Gap(2.w),
                      Text(
                        "4.5/5",
                        style: AppStyles.black16w500style.copyWith(
                          decoration: TextDecoration.underline,
                          fontSize: 16.sp,
                        ),
                      ),
                      Gap(4.w),
                      Text(
                        "(45 reviews)",
                        style: AppStyles.gry12meduemstyle.copyWith(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Gap(13.h),
                  Text(
                    " Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut elit tellus, luctus nec ullamcorper mattis, pulvinar dapibus leo. ",
                    style: AppStyles.gry12meduemstyle.copyWith(fontSize: 16.sp),
                  ),
                  Gap(200.h),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            left: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Divider(),
                  Gap(20.h),
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Price",
                            style: AppStyles.black16boldstyle.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          Gap(4.h),
                          Text(
                            "1200 \$",
                            style: AppStyles.black16boldstyle.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      Gap(16.w),
                      PrimaryButtonwidget(
                        width: 240.w,
                        height: 54.h,
                        onpress: () {},
                        icon: SvgPicture.asset(
                          AppAssets.bagSvg,
                          height: 24.h,
                          width: 24.w,
                          colorFilter: ColorFilter.mode(
                            Colors.white, // أو textColor إذا كان معرفاً
                            BlendMode.srcIn,
                          ),
                        ),
                        buttontext: "Add to Cart",
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
