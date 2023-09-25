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
      body: Column(
        children: [

        ],
      ),
    );
  }
}
