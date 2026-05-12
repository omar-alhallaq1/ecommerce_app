import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/styling/app_fonts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppStyles {
  static TextStyle primaryheadlinestyle = TextStyle(
    fontSize: 32.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.blackcolor,
  );
  static TextStyle secondaryheadlinestyle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondarycolor,
  );
  static TextStyle black16w500style = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.blackcolor,
  );
  static TextStyle gry12meduemstyle = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w400,
    color: AppColors.secondarycolor,
  );
  static TextStyle black15boldstyle = TextStyle(
    fontSize: 15.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackcolor,
  );
  static TextStyle black18boldstyle = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.blackcolor,
  );
  static TextStyle subtitlestyle = TextStyle(
    fontFamily: AppFonts.mainfontName,
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.secondarycolor,
  );
}
