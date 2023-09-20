import 'package:flutter/material.dart';

import '../../theme/theme_config.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ThemeConfig.colors.wizardColor,
        title: Text(
          ThemeConfig.strings.wizardWorld,
          style: ThemeConfig.styles.style20,
        ),
      ),
      body: Center(child: Text(ThemeConfig.strings.underConstruction),),
    );
  }
}
