import 'package:flutter/material.dart';

class ScreenDimens{
  static late Size size;
  static Future<void> init(BuildContext context)async{
    size = MediaQuery.sizeOf(context);
  }

  double get width => size.width;
  double get height => size.height;
  double get font12 => size.width/30;
  double get font14 => size.width/25;
  double get font16 => size.width/22.5;
  double get font18 => size.width/20;
  double get font20 => size.width/18;
  double get d18 => 18;
  double get d16 => 16;
  double get d10 => 10;
  double get d8 => 8;
}