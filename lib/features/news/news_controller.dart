import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:my_news/core/api/endpoints.dart';
import 'package:my_news/features/news/models/article/article_model.dart';

class NewsController with ChangeNotifier {
  NewsController({
    required Dio dio,
  }) : _dio = dio;

  final Dio _dio;

  String _countryCode = 'in';

  String get countryCode => _countryCode;
  set countryCode(String value) {
    _countryCode = value;
    notifyListeners();
  }

  Future<List<Article>> fetchTopHeadlines() async {
    try {
      final res = await _dio.get(
        Endpoints.topHeadlines,
        queryParameters: {'country': _countryCode},
      );

      final articlesData = res.data['articles'] as List;
      return articlesData
          .map((e) => Article.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
