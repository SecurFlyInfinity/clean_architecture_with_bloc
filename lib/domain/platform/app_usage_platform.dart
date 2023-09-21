import 'package:architecture/config/logger.dart';
import 'package:architecture/data/keys/app_keys.dart';
import 'package:flutter/services.dart';

class AppUsagePlatform{
  static var mainChannel = MethodChannel(AppKeys.localKey.mainChannel);
  static final instance = AppUsagePlatform._();

  AppUsagePlatform._();

  void init()async{
    try {
      AppKeys.remoteKey.apiKey = await mainChannel.invokeMethod(AppKeys.localKey.methodApiKey);
    } on PlatformException catch (e) {
      Logger.error(message: e.message!);
    }
  }
}