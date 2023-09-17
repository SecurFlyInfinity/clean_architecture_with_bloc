import 'dart:core';

import 'package:architecture/data/keys/local_keys.dart';
import 'package:architecture/data/keys/remote_keys.dart';

class AppKeys{
  static late LocalKeys localKey;
  static late RemoteKeys remoteKey;

  static void init(){
    localKey = LocalKeys();
    remoteKey = RemoteKeys();

  }
}