import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:architecture/presentation/widget/shared_widget.dart';
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

  static void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                SharedWidget.height(20),
                Text(
                  message,
                  style: ThemeConfig.styles.style16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  static void hideLoadingDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop(); // Close the dialog
  }
}