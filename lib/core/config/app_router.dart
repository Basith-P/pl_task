import 'package:go_router/go_router.dart';
import 'package:my_news/common/views/splash_page.dart';
import 'package:my_news/features/auth/views/login_page.dart';
import 'package:my_news/features/auth/views/signup_page.dart';

class AppRouter {
  static GoRouter get router => _routerConfig;

  static final _routerConfig = GoRouter(
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: '/${SplashPage.routeName}',
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: '/',
        // path: '/${LoginPage.routeName}',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        name: SignupPage.routeName,
        path: '/${SignupPage.routeName}',
        builder: (_, __) => const SignupPage(),
      ),
    ],
  );
}
