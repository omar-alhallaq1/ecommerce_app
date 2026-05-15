import 'package:ecommerce_app/core/features/cart_screen/widgets/Total_price_widget.dart';
import 'package:ecommerce_app/core/features/cart_screen/widgets/cart_item_widget.dart';
import 'package:ecommerce_app/core/features/cart_screen/widgets/title_price_widget.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:ecommerce_app/core/wedgets/primary_button_wedgit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('My Cart'),
      //   centerTitle: true,
      //   backgroundColor: Colors.white,
      //   leading: Container(),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Gap(59.h),
              SizedBox(
                width: 120.w,
                child: Text("My Cart", style: AppStyles.primaryheadlinestyle),
              ),
              Gap(20.h),
              CartItemWidget(),
              CartItemWidget(),
              CartItemWidget(),
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
      ),
    );
  }
}
