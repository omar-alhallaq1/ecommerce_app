import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_state.dart';
import 'package:ecommerce_app/core/features/cart_screen/widgets/Total_price_widget.dart';
import 'package:ecommerce_app/core/features/cart_screen/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/core/features/cart_screen/widgets/title_price_widget.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/loding_widget.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  @override
  void initState() {
    super.initState();
    if (context.read<CartCubit>().state is! SuccessCarts) {
      context.read<CartCubit>().fetchCarts();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Cart'),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   leading: Container(),
      // ),
      body: BlocBuilder<CartCubit, CartState>(
        builder: (context, state) {
          if (state is LoadingCarts) {
            return Center(
              child: LodingWidget(
                height: MediaQuery.of(context).size.height * 0.6,
              ),
            );
          }
          if (state is SuccessCarts) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Gap(59.h),
                    SizedBox(
                      width: 120.w,
                      child: Text(
                        "My Cart",
                        style: AppStyles.primaryheadlinestyle,
                      ),
                    ),
                    Gap(20.h),
                    ...(state.cart.products
                            ?.map((product) => CartItemWidget(product: product))
                            .toList() ??
                        []),
                    Gap(145.h),
                    TitlePriceWidget(title: "Sub-total", price: "5800\$"),
                    Gap(16.h),
                    TitlePriceWidget(title: "VAT (%)", price: "0.00\$"),
                    Gap(16.h),
                    TitlePriceWidget(title: "Shipping fee", price: "80\$"),
                    Gap(16.h),
                    Divider(),
                    Gap(16.h),
                    TotalPriceWidget(title: "Total", price: "5000\$"),
                    Gap(51.h),
                    PrimaryButtonwidget(
                      trailingicon: SvgPicture.asset(AppAssets.arrowright),
                      buttontext: "Go to Check Out",

                      onpress: () {},
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox.shrink();
        },
      ),
    );
  }
}
