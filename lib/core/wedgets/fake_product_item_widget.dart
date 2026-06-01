import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class FakeProductitemWidget extends StatelessWidget {
  const FakeProductitemWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15.r),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 1. مربع الصورة الوهمي
          Expanded(
            child: Container(width: double.infinity, color: Colors.grey[300]),
          ),
          Gap(8.h),
          // 2. مستطيل النص الوهمي (العنوان)
          Container(width: 100.w, height: 15.h, color: Colors.grey[300]),
          Gap(8.h),
          // 3. مستطيل السعر الوهمي
          Container(width: 50.w, height: 15.h, color: Colors.grey[300]),
        ],
      ),
    );
  }
}
