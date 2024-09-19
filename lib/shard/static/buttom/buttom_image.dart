import 'package:flutter/material.dart';


class ButtonImg extends MaterialButton {
  final double width;
  @override
  final double height;

  ButtonImg({
    super.key,
    required String imageUrl,
    required Function onPressed,
    required this.width,
    required this.height,
    required Color color,
  }) : super(
    color: color,
    onPressed: () => onPressed(),
    child: Column(
      children: [
        SizedBox(
          width: width,
          height: height,
          child: Center(
              child: Container(
                width: double.maxFinite,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(imageUrl), fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(20)),
              )),
        ),
      ],
    ),
  );
}
