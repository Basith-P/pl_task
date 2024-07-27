import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_news/core/config/app_router.dart';
import 'package:my_news/env.dart';
import 'package:my_news/features/auth/auth_controller.dart';
import 'package:my_news/features/news/news_controller.dart';
import 'package:provider/provider.dart';

final providers = [
  ChangeNotifierProvider(
    create: (_) => AuthController(
      router: AppRouter.router,
      auth: FirebaseAuth.instance,
    ),
  ),
  ChangeNotifierProvider(
    create: (_) => NewsController(
      dio: Dio(
        BaseOptions(
          baseUrl: Env.newsApiBaseUrl,
          headers: {
            'Authorization': 'Bearer ${Env.newsApiKey}',
          },
        ),
      ),
    ),
  ),
];
