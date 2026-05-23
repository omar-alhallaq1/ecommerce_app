import 'package:ecommerce_app/core/features/cart_screen/model/cart_model.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class CartItemWidget extends StatelessWidget {
  final Product product;
  const CartItemWidget({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 16).h,
      child: Container(
        padding: EdgeInsets.all(16.sp),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey, width: 0.5.w),
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 83.w,
              height: 79.h,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            Gap(16.w),
            Expanded(
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${product.productId}",
                            style: AppStyles.black18boldstyle,
                          ),

                          Icon(Icons.delete, color: Colors.red),
                        ],
                      ),
                      Gap(30.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("1200\$", style: AppStyles.black16boldstyle),
                          Row(
                            children: [
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 24.w,
                                  height: 24.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.5.w),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(Icons.add, size: 16.sp),
                                ),
                              ),
                              Gap(8.w),
                              Text("1", style: AppStyles.black16boldstyle),
                              Gap(8.w),
                              InkWell(
                                onTap: () {},
                                child: Container(
                                  width: 24.w,
                                  height: 24.h,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(width: 0.5.w),
                                    borderRadius: BorderRadius.circular(8.r),
                                  ),
                                  child: Icon(Icons.remove, size: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
