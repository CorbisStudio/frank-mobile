import 'package:flutter/material.dart';

class FlatButtonWidget extends StatelessWidget {
  const FlatButtonWidget({
    super.key,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.minimumSize,
    required this.elevation,
    required this.label,
  });

  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;
  final Size minimumSize;
  final double elevation;
  final String label;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(minimumSize),
        elevation: MaterialStateProperty.all(elevation),
        backgroundColor: MaterialStateProperty.all(backgroundColor),
        textStyle: MaterialStateProperty.all(
          TextStyle(
            color: textColor,
            fontSize: 18,
          ),
        ),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(3),
          ),
        ),
      ),
      child: Text(label),
    );
  }
}
