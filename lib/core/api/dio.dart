import 'package:dio/dio.dart';
import 'package:my_news/env.dart';

final dio = Dio(
  BaseOptions(
    baseUrl: Env.newsApiBaseUrl,
    headers: {
      'Authorization': 'Bearer ${Env.newsApiKey}',
    },
  ),
);
