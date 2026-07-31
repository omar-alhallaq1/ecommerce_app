import 'package:ecommerce_app/core/features/address_screen/adress_screen.dart';
import 'package:ecommerce_app/core/features/auth/cubit/auth_cubit.dart';
import 'package:ecommerce_app/core/features/auth/login_screen.dart';
import 'package:ecommerce_app/core/features/auth/signup_screen.dart';
import 'package:ecommerce_app/core/features/cart_screen/cubit/cart_cubit.dart';
import 'package:ecommerce_app/core/features/home_screen/model/products_model.dart';
import 'package:ecommerce_app/core/features/mainscreen/main_screen.dart';
import 'package:ecommerce_app/core/features/product_details_screen/product_details_screen.dart';
import 'package:ecommerce_app/core/features/splash_screen/splash_screen.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:ecommerce_app/core/utils/service_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class RouterGenretionConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.splashScreen,
    routes: [
      GoRoute(
        name: AppRoutes.splashScreen,
        path: AppRoutes.splashScreen,

        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        name: AppRoutes.loginscreen,
        path: AppRoutes.loginscreen,

        builder: (context, state) => BlocProvider(
          create: (context) => sl<AuthCubit>(),

          child: const LoginScreen(),
        ),
      ),
      GoRoute(
        name: AppRoutes.signupscreen,
        path: AppRoutes.signupscreen,

        builder: (context, state) => const SignupScreen(),
      ),
        GoRoute(
          name: AppRoutes.mainScreen,
          path: AppRoutes.mainScreen,

          builder: (context, state) => BlocProvider(
            create: (context) => sl<CartCubit>(),
            child: const MainScreen(),
          ),
        ),
      GoRoute(
        name: AppRoutes.productdetailsScreen,
        path: AppRoutes.productdetailsScreen,

        builder: (context, state) {
          ProductModel product = state.extra as ProductModel;
          return BlocProvider(
            create: (context) => sl<CartCubit>(),

            child: ProductDitailsScreen(product: product),
          );
        },
      ),
      GoRoute(
        name: AppRoutes.adressScreen,
        path: AppRoutes.adressScreen,

        builder: (context, state) => const AdressScreen(),
      ),
    ],
  );
}
