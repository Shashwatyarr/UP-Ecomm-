import 'package:flutter/material.dart';

class UCustomRoundedEdges extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path=Path();
    path.lineTo(0, size.height-40);
    Offset firstPointCurve=Offset(40, size.height);
    Offset secondPointCurve=Offset(size.width/2, size.height);
    path.quadraticBezierTo(firstPointCurve.dx, firstPointCurve.dy, secondPointCurve.dx, secondPointCurve.dy);

    Offset firstPointCurve2=Offset(size.width-40, size.height);
    Offset secondPointCurve2=Offset(size.width, size.height-40);
    path.quadraticBezierTo(firstPointCurve2.dx, firstPointCurve2.dy, secondPointCurve2.dx, secondPointCurve2.dy);

    path.lineTo(size.width, 0);
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }

}