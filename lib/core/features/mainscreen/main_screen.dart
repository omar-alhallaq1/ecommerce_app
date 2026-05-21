import 'package:ecommerce_app/core/features/acount_screen/acount_screen.dart';
import 'package:ecommerce_app/core/features/cart_screen/cart_screen.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/categories_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/cubit/product_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/home_screen.dart';
import 'package:ecommerce_app/core/styling/app_assets.dart';
import 'package:ecommerce_app/core/styling/app_colors.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => sl<ProductCubit>()),
        BlocProvider(create: (context) => sl<CategoriesCubit>()),
      ],
      child: HomeScreen(),
    ),
    CartScreen(),
    AcountScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: screens[selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: const Color(0xffFFFFFF),
          elevation: 0,
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
