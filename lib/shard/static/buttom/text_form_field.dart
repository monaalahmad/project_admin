import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextFormField2 extends StatelessWidget {
  final TextEditingController controller;
  final InputDecoration decoration;
  final String? Function(dynamic value) validator;
  final String labelText;

  TextFormField2({
    Key? key,
    required this.controller,
    required this.decoration,
    required this.validator,
    required this.labelText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Theme.of(context).colorScheme.tertiaryContainer,
      ),
      child: TextFormField(
        controller: controller,
        decoration: decoration,
        validator: validator,
      ),
    );
  }
}
