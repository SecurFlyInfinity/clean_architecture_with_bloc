import 'package:architecture/domain/entity/popular_article_entity.dart';
import 'package:flutter/material.dart';

import '../../theme/theme_config.dart';

class NewsInfoPage extends StatelessWidget {
  final PopularArticleEntity news;
  const NewsInfoPage({super.key,required this.news});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.wizardColor,
        title: Text(
          ThemeConfig.strings.todayNews,
          style: ThemeConfig.styles.style20,
        ),
      ),
      body: SizedBox(
        width: ThemeConfig.dimens.width,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(10.0)),
                child: Image.network(
                  news.urlToImage!,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 200.0,
                  errorBuilder: (ctx, result, progress) {
                    return const Center(
                        child: Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Icon(Icons.info),
                        ));
                  },
                ),
              ),
              Text(news.title!,style: ThemeConfig.styles.style18.copyWith(fontWeight: FontWeight.w800),),
              Text(news.content!,style: ThemeConfig.styles.style14,)
            ],
          ),
        ),
      ),
    );
  }
}
