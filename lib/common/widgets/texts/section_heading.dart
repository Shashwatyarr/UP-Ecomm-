import 'package:flutter/material.dart';

class USectionHeading extends StatelessWidget {
  const USectionHeading({
    super.key, required this.title, this.buttonTitle='View all', this.onPressed,
  });
  final String title,buttonTitle;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,style: Theme.of(context).textTheme.headlineSmall,maxLines: 1, overflow: TextOverflow.ellipsis),
        TextButton(onPressed: onPressed, child: Text(buttonTitle))
      ],
    );
  }
}
