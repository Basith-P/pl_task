import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:my_news/features/news/models/srouce/source_model.dart';

part 'article_model.freezed.dart';
part 'article_model.g.dart';

@freezed
class Article with _$Article {
  const factory Article({
    String? title,
    String? url,
    String? publishedAt,
    Source? source,
    String? author,
    String? urlToImage,
    String? description,
    String? content,
  }) = _Article;

  factory Article.fromJson(Map<String, dynamic> json) =>
      _$ArticleFromJson(json);
}
