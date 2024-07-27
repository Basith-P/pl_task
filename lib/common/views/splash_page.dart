import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_news/features/auth/views/login/login_page.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  static const routeName = 'splash';

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      FirebaseAuth.instance.authStateChanges().listen((user) {
        if (user == null) {
          context.go(LoginPage.routeName);
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
