import 'package:flutter/foundation.dart';

class Logger{
  static void debug({String? tag,required Object message}){
    if (kDebugMode) {
      print("DEBUG ${tag??"TAG"}: $message");
    }
  }

  static void error({String? tag,required Object message}){
    if (kDebugMode) {
      print("ERROR ${tag??"TAG"}: $message");
    }
  }

  static void info({String? tag,required Object message}){
    if (kDebugMode) {
      print("INFO ${tag??"TAG"}: $message");
    }
  }
}