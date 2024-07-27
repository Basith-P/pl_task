import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/features/news/models/article/article_model.dart';

class NewsListItem extends StatelessWidget {
  const NewsListItem({
    required this.article,
    super.key,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    article.source?.name ?? 'Unknown',
                    style: textTheme.titleSmall,
                  ),
                  gapH4,
                  Text(
                    article.title ?? 'Unknown',
                    style: textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 3,
                    softWrap: true,
                  ),
                ],
              ),
            ),
            gapW16,
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: CachedNetworkImage(
                imageUrl: article.urlToImage ??
                    'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/11/breaking-1603159815-1606179737.jpg',
                imageBuilder: (context, imageProvider) => Image(
                  width: 100,
                  height: 100,
                  image: imageProvider,
                  fit: BoxFit.cover,
                ),
                errorWidget: (context, url, error) => const SizedBox.shrink(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
