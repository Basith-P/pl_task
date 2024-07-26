import 'package:flutter/material.dart';
import 'package:my_news/core/config/theme/app_theme.dart';
import 'package:my_news/features/auth/views/signup_page.dart';
import 'package:my_news/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      home: const SignupPage(),
    );
  }
}
