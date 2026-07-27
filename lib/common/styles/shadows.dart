
import 'package:flutter/material.dart';

import '../../utils/constants/colors.dart';

class UShadow{
  UShadow._();

  static List<BoxShadow> searchBarShadow=[BoxShadow(
      color: UColors.dark.withValues(alpha: 0.1),
      spreadRadius: 2.0,
      blurRadius: 4.0
  ),
  ];
}