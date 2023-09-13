import 'package:flutter/cupertino.dart';

class ScreenDimens{
  static late Size size;
  static void init(BuildContext context){
    size = MediaQuery.sizeOf(context);

  }

  static double get width => size.width;
  static double get height => size.height;
  static double get font12 => size.width/30;
  static double get font14 => size.width/25;
  static double get font16 => size.width/22.5;
  static double get font18 => size.width/20;
  static double get font20 => size.width/18;
}