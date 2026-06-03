import 'package:ecommerce_app/core/features/acount_screen/widgets/acount_item_widget.dart';
import 'package:ecommerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
            indent: 40.w,
            endIndent: 0,
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
            onTap: () {
              showLogoutDialog(context);
            },
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

  void showLogoutDialog(BuildContext Parentcontext) {
    showDialog(
      context: Parentcontext,
      builder: (context) => AlertDialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.r),
        ),
        contentPadding: EdgeInsets.zero,
        content: SizedBox(
          height: 400.h,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 24.h),
            child: Padding(
              padding: const EdgeInsets.all(8.0).w,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Gap(20.h),
                  SvgPicture.asset(
                    AppAssets.warning,
                    height: 48.h,
                    width: 48.w,
                  ),
                  Gap(12.h),
                  Text(
                    " logout?",
                    style: AppStyles.black16boldstyle,
                    textAlign: TextAlign.center,
                  ),
                  Gap(8.h),
                  Text(
                    "Are you sure you want to logout?",
                    style: AppStyles.gry12meduemstyle,
                    textAlign: TextAlign.center,
                  ),
                  Gap(24.h),
                  PrimaryButtonwidget(
                    onpress: () {
                      Parentcontext.read<AuthCubit>().logout();
                      GoRouter.of(Parentcontext).go(AppRoutes.loginscreen);
                    },
                    buttontext: "yes Logout",
                    buttoncolor: Colors.red,
                    borderradius: 12.r,
                  ),
                  Gap(12.h),
                  PrimaryButtonwidget(
                    onpress: () {
                      Navigator.pop(Parentcontext);
                    },
                    buttontext: "No Cancel",
                    buttoncolor: Colors.white,
                    textColor: Colors.black,
                    borderradius: 12.r,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
