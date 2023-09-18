import 'package:flutter/material.dart';

class CShape extends StatelessWidget {
  final double radius;
  final double? width;
  final double? height;
  final Widget child;
  final Color strokeColor;
  final double strokeWidth;
  final Color backgroundColor;


  const CShape({super.key, this.width,this.height,this.radius=0, required this.child, this.strokeColor=Colors.transparent, this.strokeWidth=0,
    this.backgroundColor=Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(radius),
        border: Border.all(color: strokeColor,width: strokeWidth)
      ),
      child: child,
    );
  }
}
