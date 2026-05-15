import 'package:ecommerce_app/core/features/address_screen/adress_screen.dart';
import 'package:ecommerce_app/core/features/auth/login_screen.dart';
import 'package:ecommerce_app/core/features/auth/signup_screen.dart';
import 'package:ecommerce_app/core/features/mainscreen/main_screen.dart';
import 'package:ecommerce_app/core/features/product_details_screen/product_details_screen.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class RouterGenretionConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginscreen,
    routes: [
      GoRoute(
        name: AppRoutes.loginscreen,
        path: AppRoutes.loginscreen,

        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        name: AppRoutes.signupscreen,
        path: AppRoutes.signupscreen,

        builder: (context, state) => const SignupScreen(),
      ),
      GoRoute(
        name: AppRoutes.mainScreen,
        path: AppRoutes.mainScreen,

        builder: (context, state) => const MainScreen(),
      ),
      GoRoute(
        name: AppRoutes.productdetailsScreen,
        path: AppRoutes.productdetailsScreen,

        builder: (context, state) => const ProductDitailsScreen(),
      ),
      GoRoute(
        name: AppRoutes.adressScreen,
        path: AppRoutes.adressScreen,

        builder: (context, state) => const AdressScreen(),
      ),
    ],
  );
}
