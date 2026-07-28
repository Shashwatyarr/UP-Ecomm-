import 'package:ecomm/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

import 'circular_container.dart';
import 'clipper/rounded_edges_container.dart';
import '../../utils/constants/colors.dart';

class UPrimaryHeaderContainer extends StatelessWidget {
  const UPrimaryHeaderContainer({
    super.key, required this.child, required this.height,
  });
  final Widget child;
  final double height;
  @override
  Widget build(BuildContext context) {
    return URoundedEdges(
      child: Container(
        height: height,
        color: UColors.primary,
        child: Stack(
          children: [
            Positioned(
              top: -150,
              right: -160,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            Positioned(
              top: -50,
              right: -250,
              child: UCircularContainer(
                height: USizes.homePrimaryHeaderHeight,
                width: USizes.homePrimaryHeaderHeight,
                backgroundColor: UColors.white.withValues(alpha: 0.1),
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}


