import 'package:flutter/material.dart';
import 'package:my_news/features/auth/views/signup_page.dart';
import 'package:my_news/l10n/l10n.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      home: SignupPage(),
    );
  }
}
