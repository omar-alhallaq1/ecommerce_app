import 'package:ecommerce_app/core/features/acount_screen/widgets/acount_item_widget.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class AcountScreen extends StatelessWidget {
  const AcountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Gap(59.h),
          Center(
            child: SizedBox(
              width: 123.w,
              child: Text("Account", style: AppStyles.primaryheadlinestyle),
            ),
          ),
          Gap(24.h),
          Divider(),
          Gap(21.h),
          AcountItemWidget(
            title: "My Orders",
            icon: AppAssets.boxsvg,
            onTap: () {},
          ),
          Gap(25.h),
          Container(
            width: double.infinity,
            height: 8.h,
            color: const Color(0xffAAAAAA).withValues(alpha: 0.3),
          ),
          Gap(25.h),
          AcountItemWidget(
            title: "My Details",
            icon: AppAssets.detailssvg,
            onTap: () {},
          ),
          Gap(25.h),
          Divider(
            height: 1,
            thickness: 1,
            color: const Color(0xffE6E6E6),
            indent: 40.w,
            endIndent: 0,
          ),
          Gap(25.h),
          AcountItemWidget(
            title: "Address Book",
            icon: AppAssets.addresssvg,
            onTap: () {
              GoRouter.of(context).push(AppRoutes.adressScreen);
            },
          ),
          Gap(25.h),
          Divider(
            height: 1,
            thickness: 1,
            color: const Color(0xffE6E6E6),
            indent: 40.w, // هاد الرقم بيحسب (عرض الأيقونة 24 + الفراغ 16)
            endIndent: 0, // خليه 0 عشان يوصل لآخر الشاشة من اليمين
          ),
          Gap(25.h),
          AcountItemWidget(
            title: "FAQs",
            icon: AppAssets.questionsvg,
            onTap: () {},
          ),
          Gap(25.h),
          Divider(
            height: 1,
            thickness: 1,
            color: const Color(0xffE6E6E6),
            indent: 40.w,
            endIndent: 0,
          ),
          Gap(25.h),
          AcountItemWidget(
            title: "Help Center",
            icon: AppAssets.headphonessvg,
            onTap: () {},
          ),
          Gap(25.h),
          Container(
            width: double.infinity,
            height: 8.h,
            color: const Color(0xffE6E6E6).withValues(alpha: 0.2),
          ),
          Gap(175.h),
          InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(16).w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SvgPicture.asset(AppAssets.logout, height: 24.h, width: 24.w),
                  Gap(16.w),
                  Text(
                    "Logout",
                    style: AppStyles.black16boldstyle.copyWith(
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Gap(75.h),
        ],
      ),
    );
  }
}
