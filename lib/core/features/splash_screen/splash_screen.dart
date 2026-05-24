import 'dart:async';

import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:ecommerce_app/core/utils/storage_helpar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController animationcontroller;
  late Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationcontroller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1, milliseconds: 500),
    )..repeat(reverse: true);
    animation = CurvedAnimation(
      parent: animationcontroller,
      curve: Curves.easeInOut,
    );
    waitAnimationNavigate();
  }

  @override
  void dispose() {
    // 1. نقتل الأنيميشن أولاً عشان ما يستهلك الرام
    animationcontroller.dispose();

    // 2. بعدين نخلي فلاتر يدمر الشاشة بالكامل
    super.dispose();
  }

  Future<void> waitAnimationNavigate() async {
    await Future.delayed(const Duration(seconds: 3)); // مدة الانتظار قبل التنقل
    Future.delayed(const Duration(seconds: 3), () {
      sl<StorageHelpar>().getToken().then((value) {
        if (value != null && value.isNotEmpty) {
          if (!mounted) {
            return;
          }
          // لو المستخدم قفل التطبيق قبل ما يخلص الانتظار، ما نعملش حاجة
          GoRouter.of(context).pushReplacementNamed(AppRoutes.mainScreen);
        } else {
          if (!mounted) return;
          GoRouter.of(context).pushReplacementNamed(AppRoutes.loginscreen);
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ScaleTransition(
          scale: animation,
          child: Image.asset(AppAssets.logo, height: 150.h, width: 150.w),
        ),
      ),
    );
  }
}
