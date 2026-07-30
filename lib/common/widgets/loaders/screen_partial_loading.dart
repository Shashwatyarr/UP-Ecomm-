
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UPartialScreenLoading extends StatelessWidget {
  const UPartialScreenLoading({super.key, required this.child, this.isLoading = false});

  final Widget child;
  final bool isLoading;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [

        child,

        if(isLoading) Positioned(
          top: 0,
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            color: UColors.black.withValues(alpha: 0.5),
              child: Center(child: CircularProgressIndicator(color: UColors.primary))),
        ),

      ],
    );
  }
}
