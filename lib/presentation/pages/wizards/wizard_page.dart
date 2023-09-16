import 'package:flutter/material.dart';

import '../../theme/theme_config.dart';

class WizardPage extends StatelessWidget {
  const WizardPage({super.key});

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
      body: Container(),
    );
  }
}
