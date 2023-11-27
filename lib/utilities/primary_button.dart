import 'package:flutter/material.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  VoidCallback onPressed;
  PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed: onPressed,
      child: Text(text),
    );
  }
}
