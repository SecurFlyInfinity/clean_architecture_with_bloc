import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';

class DialogUtils {
  static final DialogUtils _instance = DialogUtils.internal();

  DialogUtils.internal();

  factory DialogUtils() => _instance;

  static void showCustomDialog(BuildContext context,
      {required String title,
        String? subtitle,
        required List<Widget> actions}) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
            backgroundColor: Colors.white,
            elevation: 0,
            title: Text(title,style: ThemeConfig.styles.style16,),
            content: subtitle!=null?Text(subtitle,style: ThemeConfig.styles.style12,):null,
            actions: actions
          );
        });
  }
}