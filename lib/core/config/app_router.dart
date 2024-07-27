import 'package:go_router/go_router.dart';
import 'package:my_news/common/views/splash_page.dart';
import 'package:my_news/features/auth/views/login_page.dart';
import 'package:my_news/features/auth/views/signup/signup_page.dart';
import 'package:my_news/features/news/views/home_page.dart';

class AppRouter {
  static GoRouter get router => _routerConfig;

  static final _routerConfig = GoRouter(
    initialLocation: '/${SignupPage.routeName}',
    routes: [
      GoRoute(
        name: SplashPage.routeName,
        path: '/${SplashPage.routeName}',
        builder: (_, __) => const SplashPage(),
      ),
      GoRoute(
        name: LoginPage.routeName,
        path: '/${LoginPage.routeName}',
        builder: (_, __) => const LoginPage(),
      ),
      GoRoute(
        name: SignupPage.routeName,
        path: '/${SignupPage.routeName}',
        builder: (_, __) => const SignupPage(),
      ),
      GoRoute(
        path: '/',
        builder: (_, __) => const HomePage(),
      ),
    ],
  );
}
