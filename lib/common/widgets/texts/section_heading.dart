import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
    this.showActionButton=true,
  });

  final String title, buttonTitle;
  final void Function()? onPressed;
  final bool showActionButton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        if (showActionButton)
          TextButton(onPressed: onPressed, child: Text(buttonTitle)),
      ],
    );
  }
}
