import 'package:flutter/material.dart';


class UFormDivider extends StatelessWidget {
  const UFormDivider({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(child: Divider(indent: 60, endIndent: 5)),
        Text(
          title,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        Expanded(child: Divider(indent: 5, endIndent: 60)),
      ],
    );
  }
}
