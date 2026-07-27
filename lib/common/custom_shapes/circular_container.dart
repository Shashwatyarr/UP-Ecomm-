import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class UCircularContainer extends StatelessWidget {
  const UCircularContainer({
    super.key, this.height=400,  this.width=400,  this.radius=400,  this.backgroundColor=UColors.white,  this.padding,  this.margin,  this.child,
  });
  final double height,width,radius;
  final Color backgroundColor;
  final EdgeInsetsGeometry? padding,margin;
  final Widget? child;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      margin: margin,
      padding: padding,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
