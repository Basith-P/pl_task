import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_news/features/auth/views/login/login_page.dart';
import 'package:my_news/features/news/news_controller.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      final remoteConfig = FirebaseRemoteConfig.instance;
      await remoteConfig.setConfigSettings(
        RemoteConfigSettings(
          fetchTimeout: const Duration(minutes: 1),
          minimumFetchInterval: const Duration(minutes: 5),
        ),
      );
      await remoteConfig.fetchAndActivate();

      remoteConfig.onConfigUpdated.listen((event) async {
        await remoteConfig.activate();
        final code = remoteConfig.getString('country_code');
        context.read<NewsController>().countryCode = code;
      });

      final code = remoteConfig.getString('country_code');
      context.read<NewsController>().countryCode = code;
      debugPrint('COUNTRY CODE: $code');

      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          context.goNamed(LoginPage.routeName);
        } else {
          context.go('/');
        }
      });
    });

    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
