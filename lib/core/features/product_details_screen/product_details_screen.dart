import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/utils/animated_snak_dailog.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class ProductDitailsScreen extends StatelessWidget {
  final ProductModel product;
  const ProductDitailsScreen({super.key, required this.product});

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
                    height: 341.h,
                    width: 341.w,
                    child: CachedNetworkImage(
                      imageUrl: product.image ?? "",
                      height: 300.h,
                      width: double.infinity,
                      fit: BoxFit.contain,
                    ),
                  ),
                  Gap(12.h),
                  Text(
                    "${product.title}",
                    style: AppStyles.black18boldstyle.copyWith(fontSize: 24.sp),
                  ),
                  Gap(8.h),
                  Row(
                    children: [
                      Icon(Icons.star, color: Color(0xffFFA928), size: 18.sp),
                      Gap(2.w),
                      product.rating != null
                          ? Text(
                              "${product.rating!.rate}/5",
                              style: AppStyles.black16w500style.copyWith(
                                decoration: TextDecoration.underline,
                                fontSize: 16.sp,
                              ),
                            )
                          : SizedBox.shrink(),
                      Gap(4.w),
                      product.rating != null
                          ? Text(
                              "(${product.rating!.count} reviews)",
                              style: AppStyles.gry12meduemstyle.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                  Gap(13.h),
                  Text(
                    " ${product.description}",
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
                            "${product.price}",
                            style: AppStyles.black16boldstyle.copyWith(
                              fontSize: 24.sp,
                            ),
                          ),
                        ],
                      ),
                      Gap(16.w),
                      BlocConsumer<CartCubit, CartState>(
                        listener: (context, state) => {
                          if (state is SuccessAddingToCart)
                            {
                              showAnimatedSnakDailog(
                                context,
                                massage: "Product added to cart successfully",
                                type: AnimatedSnackBarType.success,
                              ),
                            },
                        },
                        builder: (context, state) {
                          if (state is AddingToCart) {
                            return PrimaryButtonwidget(
                              width: 240.w,
                              height: 54.h,
                              onpress: () {},
                              isloading: true,
                              icon: SvgPicture.asset(
                                AppAssets.bagSvg,
                                height: 24.h,
                                width: 24.w,
                                colorFilter: ColorFilter.mode(
                                  Colors.white, // أو textColor إذا كان معرفاً
                                  BlendMode.srcIn,
                                ),
                              ),
                              buttontext: "Adding...",
                            );
                          }
                          return PrimaryButtonwidget(
                            width: 240.w,
                            height: 54.h,
                            onpress: () {
                              context.read<CartCubit>().addToCart(
                                date: DateTime.now().toString(),
                                product: product,
                                quantity: 1,
                              );
                            },
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
                          );
                        },
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
