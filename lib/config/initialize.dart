import 'package:architecture/config/logger.dart';
import 'package:architecture/data/keys/app_keys.dart';
import 'package:architecture/presentation/theme/theme_config.dart';
import 'package:flutter/cupertino.dart';

class Initialize{
  static void init(BuildContext context){
    ThemeConfig.init(context);

    AppKeys.init();
    Logger.debug(message: AppKeys.localKey.dbName);
    Logger.debug(message: AppKeys.remoteKey.baseURL);
  }
}