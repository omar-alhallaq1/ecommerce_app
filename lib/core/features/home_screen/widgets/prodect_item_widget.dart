import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/styling/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

class ProdectItemWidget extends StatelessWidget {
  final String title;
  final String price;
  final String image;
  final Function() onTap;
  const ProdectItemWidget({
    super.key,
    required this.title,
    required this.price,
    required this.onTap,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: CachedNetworkImage(
                width: double.infinity,
                height: 150.h,
                imageUrl: image,
                fit: BoxFit.cover,
              ),
            ),

            Text(title, maxLines: 1, style: AppStyles.black18boldstyle),
            Gap(8.h),
            Text(price, style: AppStyles.gry12meduemstyle),
          ],
        ),
      ),
    );
  }
}
