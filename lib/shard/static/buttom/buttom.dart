import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final String text;
  final Function onPressed;
  final Color color;
  final double radius;

  Button({
    required this.text,
    required this.onPressed,
    required this.width,
    required this.height,
    required this.color,
    required this.radius,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: color,
      onPressed: () => onPressed(),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
