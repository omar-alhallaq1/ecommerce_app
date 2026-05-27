import 'package:ecommerce_app/core/wedgets/fake_category_item.dart';
import 'package:ecommerce_app/core/wedgets/fake_product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

class HomeScreenShimmerLoading extends StatelessWidget {
  const HomeScreenShimmerLoading({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 5,
                itemBuilder: (context, index) => const FakeCategoryItemWidget(),
              ),
            ),
          ),

          Gap(20.h),

          Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 8.w,
                mainAxisSpacing: 8.h,
                childAspectRatio: 0.9,
              ),
              itemCount: 6,
              itemBuilder: (context, index) => const FakeProductitemWidget(),
            ),
          ),
        ],
      ),
    );
  }
}
