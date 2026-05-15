import 'package:ecommerce_app/core/features/address_screen/widgets/adress_item_widget.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class AdressScreen extends StatelessWidget {
  const AdressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16).w,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gap(59.h),
            Center(
              child: SizedBox(
                width: 123.w,
                child: Text("Address", style: AppStyles.primaryheadlinestyle),
              ),
            ),
            Gap(24.h),
            Divider(),
            Gap(20.h),
            Text(
              "Saved Address",
              style: AppStyles.primaryheadlinestyle.copyWith(
                fontSize: 16.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            Gap(14.h),
            Expanded(
              child: ListView(
                children: [
                  AdressItemWidget(
                    address: "Home",
                    addressdetails: "925 S Chugach St #APT 10, Alas...",
                  ),
                  Gap(12.h),
                  AdressItemWidget(
                    address: "Office",
                    addressdetails: "2438 6th Ave, Ketchikan, Alaska 9",
                  ),
                  Gap(12.h),
                  AdressItemWidget(
                    address: "Apartment",
                    addressdetails: "2551 Vista Dr #B301, Juneau, ",
                  ),
                  Gap(12.h),
                  AdressItemWidget(
                    address: "Parent’s House",
                    addressdetails: "4821 Ridge Top Cir, Anchorage, ",
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
