import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

class LodingWidget extends StatelessWidget {
  final double? width;
  final double? height;
  const LodingWidget({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width ?? double.infinity,
      height: height ?? double.infinity,
      child: Center(
        child: LottieBuilder.asset(
          AppAssets.lodinglottie,
          width: 150.sp,
          height: 150.sp,
        ),
      ),
    );
  }
}
