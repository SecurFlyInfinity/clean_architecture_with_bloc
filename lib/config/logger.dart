import 'package:flutter/foundation.dart';

class Logger{
  static void debug({required String tag,required Object message}){
    if (kDebugMode) {
      print("DEBUG $tag: $message");
    }
  }

  static void error({required String tag,required Object message}){
    if (kDebugMode) {
      print("ERROR $tag: $message");
    }
  }

  static void info({required String tag,required Object message}){
    if (kDebugMode) {
      print("INFO $tag: $message");
    }
  }
}