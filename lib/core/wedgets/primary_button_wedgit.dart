import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButtonwidget extends StatelessWidget {
  final String? buttontext;
  final Color? buttoncolor;
  final double? width;
  final double? height;
  final double? borderradius;
  final Color? textColor;
  final double? fontsize;
  final void Function()? onpress;

  const PrimaryButtonwidget({
    super.key,
    this.buttontext,
    this.buttoncolor,
    this.width,
    this.height,
    this.borderradius,
    this.textColor,
    this.onpress,
    this.fontsize,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onpress,
      style: ElevatedButton.styleFrom(
        backgroundColor: buttoncolor ?? AppColors.primarycolor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderradius ?? 8.r),
        ),
        fixedSize: Size(width ?? 331.w, height ?? 56.h),
      ),
      child: Text(
        buttontext ?? "Button",
        style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: fontsize ?? 16.sp,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
