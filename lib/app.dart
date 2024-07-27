import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_news/core/api/dio.dart';
import 'package:my_news/core/config/app_router.dart';
import 'package:my_news/core/config/theme/app_theme.dart';
import 'package:my_news/core/global_keys.dart';
import 'package:my_news/features/auth/auth_controller.dart';
import 'package:my_news/features/news/news_controller.dart';
import 'package:my_news/l10n/l10n.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AuthController(
            router: AppRouter.router,
            auth: FirebaseAuth.instance,
            firestore: FirebaseFirestore.instance,
          ),
        ),
        ChangeNotifierProvider(create: (_) => NewsController(dio: dio)),
      ],
      child: MaterialApp.router(
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        debugShowCheckedModeBanner: false,
        theme: AppTheme.themeData(),
        routerConfig: AppRouter.router,
        scaffoldMessengerKey: scaffoldMessengerKey,
      ),
    );
  }
}
