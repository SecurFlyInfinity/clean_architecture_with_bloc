import 'package:architecture/config/app_route.dart';
import 'package:flutter/material.dart';

import '../../../config/initialize.dart';
import '../../theme/theme_config.dart';
import '../../widget/dashboard_item.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    Initialize.init(context);
    return Scaffold(
      appBar: AppBar(
          backgroundColor: ThemeConfig.colors.background,
          title: Text(
            ThemeConfig.strings.dashboard,
            style: ThemeConfig.styles.style20,
          ),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          DashboardItem(
            backgroundColor: Colors.orange.shade50,
            title: ThemeConfig.strings.contacts,
            subTitle: ThemeConfig.strings.sqlite,
            onTap: () => Navigator.pushNamed(context, AppRoute.homeRoute),
          ),
          DashboardItem(
            backgroundColor: Colors.blue.shade50,
            title: ThemeConfig.strings.wizardWorld,
            subTitle: ThemeConfig.strings.restAPI,
            onTap: () => Navigator.pushNamed(context, AppRoute.wizardRoute),
          ),
        ],
      ),
    );
  }
}

