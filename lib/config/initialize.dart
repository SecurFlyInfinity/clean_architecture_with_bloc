import 'package:architecture/config/logger.dart';
import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/cupertino.dart';

class Initialize{
  static void init(BuildContext context){
    ThemeConfig.init(context);
    Logger.debug(message: "Initializer");
  }
}