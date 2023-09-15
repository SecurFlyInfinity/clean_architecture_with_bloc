import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/material.dart';

class AppTextStyle {

  TextStyle get style12 => TextStyle(
      fontSize: ThemeConfig.dimens.font12,
      fontFamily: ThemeConfig.strings.fontName,
      color: ThemeConfig.colors.primary);

  TextStyle get style14 => TextStyle(
      fontSize: ThemeConfig.dimens.font14,
      fontFamily: ThemeConfig.strings.fontName,
      color: ThemeConfig.colors.primary);

  TextStyle get style16 => TextStyle(
      fontSize: ThemeConfig.dimens.font16,
      fontFamily: ThemeConfig.strings.fontName,
      color: ThemeConfig.colors.primary);

  TextStyle get style18 => TextStyle(
      fontSize: ThemeConfig.dimens.font18,
      fontFamily: ThemeConfig.strings.fontName,
      color: ThemeConfig.colors.primary);

  TextStyle get style20 => TextStyle(
      fontSize: ThemeConfig.dimens.font20,
      fontFamily: ThemeConfig.strings.fontName,
      color: ThemeConfig.colors.primary);
}
