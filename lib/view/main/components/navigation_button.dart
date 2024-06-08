import 'package:flutter/material.dart';

class NavigationTextButton extends StatelessWidget {
  final VoidCallback onTap;
  final String text;

  const NavigationTextButton(
      {super.key, required this.onTap, required this.text});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(
          text,
          style: Theme.of(context).textTheme.labelMedium!.copyWith(
              fontWeight: FontWeight.bold,
              color: const Color.fromARGB(255, 5, 5, 5),
              fontSize: 16),
        ));
  }
}