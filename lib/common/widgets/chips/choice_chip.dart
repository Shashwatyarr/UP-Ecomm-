import 'package:ecomm/common/custom_shapes/circular_container.dart';
import 'package:ecomm/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants/colors.dart';

class UChoiceChip extends StatelessWidget {
  const UChoiceChip({super.key, required this.text, required this.selected, required this.onSelected});
  final String text;
  final bool selected;
  final Function(bool?) onSelected;
  @override
  Widget build(BuildContext context) {
    bool isColor=UHelperFunctions.getColor(text)!=null;
    return ChoiceChip(
      label: isColor?SizedBox():Text(text),
      selected: selected,
      onSelected: onSelected,
      labelStyle: TextStyle(color: selected?UColors.white:null),
      shape: isColor?CircleBorder():null,
      padding: isColor?EdgeInsets.zero:null,
      labelPadding: isColor?EdgeInsets.zero:null,
      backgroundColor: isColor?UHelperFunctions.getColor(text):null,
      avatar: isColor?UCircularContainer(width: 50,height: 50,backgroundColor: UHelperFunctions.getColor(text)!):null,
    );
  }
}
