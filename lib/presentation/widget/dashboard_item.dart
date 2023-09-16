import 'package:flutter/material.dart';

import '../theme/theme_config.dart';

class DashboardItem extends StatelessWidget {
  final String title;
  final String subTitle;
  final Color backgroundColor;
  final GestureTapCallback? onTap;
  const DashboardItem({super.key, required this.title, required this.subTitle,required this.backgroundColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3.0,
      color: backgroundColor,
      margin: const EdgeInsets.all(8.0),
      child: InkWell(
          onTap: onTap,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: ThemeConfig.styles.style16,
              ),
              Text(
                subTitle,
                style: ThemeConfig.styles.style20.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          )
      ),
    );
  }
}