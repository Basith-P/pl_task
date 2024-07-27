import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:my_news/common/views/widgets/gaps.dart';
import 'package:my_news/core/config/theme/app_colors.dart';
import 'package:my_news/features/auth/auth_controller.dart';
import 'package:my_news/features/news/models/article/article_model.dart';
import 'package:my_news/features/news/news_controller.dart';
import 'package:my_news/features/news/views/news_list/widgets/news_list_item.dart';
import 'package:my_news/l10n/l10n.dart';
import 'package:provider/provider.dart';

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
        actions: [
          TextButton.icon(
            onPressed: () {},
            label: Text(
              context.watch<NewsController>().countryCode.toUpperCase(),
              style: textTheme.titleSmall!.copyWith(color: AppColors.onPrimary),
            ),
            icon: Image.asset(
              'assets/images/navigation_arrow.png',
              width: 16,
              height: 16,
              fit: BoxFit.contain,
            ),
          ),
          gapW4,
          IconButton(
            onPressed: context.read<AuthController>().signOut,
            icon: const Icon(FluentIcons.sign_out_24_regular),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16).copyWith(bottom: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.l10n.topHeadlines,
              style: textTheme.titleMedium,
            ),
            gapH12,
            Expanded(
              child: FutureBuilder(
                future: context.read<NewsController>().fetchTopHeadlines(),
                builder: (_, AsyncSnapshot<List<Article>> snapshot) {
                  if (snapshot.connectionState != ConnectionState.done) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (snapshot.hasError) {
                    debugPrint('HOME PAGE: ${snapshot.error}');
                    return Center(child: Text(context.l10n.somethingWrong));
                  }

                  final data = snapshot.data!;

                  return ListView.separated(
                    padding: const EdgeInsets.only(bottom: 16),
                    itemCount: 10,
                    separatorBuilder: (_, __) => gapH12,
                    itemBuilder: (_, i) => NewsListItem(article: data[i]),
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
