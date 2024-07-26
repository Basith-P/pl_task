import 'package:flutter/material.dart';
import 'package:my_news/core/config/app_router.dart';
import 'package:my_news/core/config/theme/app_theme.dart';
import 'package:my_news/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.themeData(),
      routerConfig: AppRouter.router,
    );
  }
}
