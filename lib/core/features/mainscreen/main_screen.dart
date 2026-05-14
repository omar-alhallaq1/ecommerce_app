import 'package:ecommerce_app/core/features/home_screen/home_screen.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => MainScreenState();
}

class MainScreenState extends State<MainScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [
    HomeScreen(),
    Container(color: Colors.green),
    Container(color: Colors.yellow),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.primarycolor,
          unselectedItemColor: AppColors.graycolor,
          currentIndex: selectedIndex,
          onTap: (value) {
            setState(() {
              selectedIndex = value;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.homeSvg,
                height: 24.h,
                width: 24.w,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.cartSvg,
                height: 24.h,
                width: 24.w,
              ),
              label: 'Cart',
            ),

            BottomNavigationBarItem(
              icon: SvgPicture.asset(
                AppAssets.accountSvg,
                height: 24.h,
                width: 24.w,
              ),
              label: 'Account',
            ),
          ],
        ),
      ),
    );
  }
}
