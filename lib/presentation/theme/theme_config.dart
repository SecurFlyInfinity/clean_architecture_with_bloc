import 'package:architecture/presentation/theme/app_colors.dart';
import 'package:architecture/presentation/theme/screen_dimens.dart';
import 'package:flutter/cupertino.dart';

import 'app_strings.dart';
import 'app_text_style.dart';

class ThemeConfig{

  static late AppColors colors;
  static late ScreenDimens dimens;
  static late AppStrings strings;
  static late AppTextStyle styles;

  static void init(BuildContext context){
    ScreenDimens.init(context);
    colors = AppColors();
    dimens = ScreenDimens();
    strings = AppStrings();
    styles = AppTextStyle();
  }
}