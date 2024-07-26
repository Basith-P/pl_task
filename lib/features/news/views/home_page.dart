import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/core/config/theme/app_colors.dart';
import 'package:my_news/l10n/l10n.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.onPrimary,
        title: Text(context.l10n.appNameInAppBar),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.topHeadlines,
              style: textTheme.titleMedium,
            ),
            gapH12,
            Expanded(
              child: ListView.separated(
                itemCount: 10,
                separatorBuilder: (_, __) => gapH12,
                itemBuilder: (BuildContext context, int index) {
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
                                  'News Source',
                                  style: textTheme.titleSmall,
                                ),
                                gapH4,
                                Text(
                                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. In vel sapien tellus. Ut ...',
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
                              imageUrl:
                                  'https://resize.indiatvnews.com/en/resize/newbucket/715_-/2020/11/breaking-1603159815-1606179737.jpg',
                              imageBuilder: (context, imageProvider) => Image(
                                width: 100,
                                height: 100,
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                              errorWidget: (context, url, error) =>
                                  const SizedBox.shrink(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
