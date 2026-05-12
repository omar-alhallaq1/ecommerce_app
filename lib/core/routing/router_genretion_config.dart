import 'package:ecommerce_app/core/features/auth/login_screen.dart';
import 'package:ecommerce_app/core/routing/app_routes.dart';
import 'package:go_router/go_router.dart';

class RouterGenretionConfig {
  static GoRouter goRouter = GoRouter(
    initialLocation: AppRoutes.loginscreen,
    routes: [
      GoRoute(
        path: '/loginscreen',
        name: 'loginscreen',
        builder: (context, state) => const LoginScreen(),
      ),
    ],
  );
}
