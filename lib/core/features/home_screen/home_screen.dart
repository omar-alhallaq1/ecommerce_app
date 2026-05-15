import 'package:ecommerce_app/core/features/home_screen/widgets/category_item_widget.dart';
import 'package:ecommerce_app/core/features/home_screen/widgets/prodect_item_widget.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24).w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Gap(59.h),

          SizedBox(
            width: 128.w,
            child: Text("Discover", style: AppStyles.primaryheadlinestyle),
          ),
          Gap(16.h),
          Row(
            children: [
              CustomTextField(width: 281.w, hintText: "Search for Clothes"),
              Gap(8.w),
              Container(
                width: 52.w,
                height: 52.h,
                decoration: BoxDecoration(
                  color: AppColors.primarycolor,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: SvgPicture.asset(
                    AppAssets.filterSvg,
                    width: 24.w,
                    height: 24.h,
                    colorFilter: const ColorFilter.mode(
                      Colors.white,
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Gap(16.h),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
                CategoryItemWidget(categoryName: "Shoes"),
              ],
            ),
          ),
          Gap(16.h),
          Expanded(
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.sp,
                mainAxisSpacing: 8.sp,
                childAspectRatio: 0.73.sp,
              ),
              children: [
                ProdectItemWidget(
                  title: "Title",
                  price: r"1999$",
                  onTap: () => GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.productdetailsScreen),
                ),
                ProdectItemWidget(
                  title: "Title",
                  price: r"1999$",
                  onTap: () => GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.productdetailsScreen),
                ),
                ProdectItemWidget(
                  title: "Title",
                  price: r"1999$",
                  onTap: () => GoRouter.of(
                    context,
                  ).pushNamed(AppRoutes.productdetailsScreen),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
