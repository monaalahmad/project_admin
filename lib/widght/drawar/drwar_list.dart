import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerList extends StatelessWidget {
  final String title;
  final Widget icon;
  final VoidCallback press;

  const DrawerList({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding:const EdgeInsets.symmetric(horizontal: 16.0),
      leading: icon,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
           // color: Theme.of(context).colorScheme.primaryContainer,
          fontSize: 18,
        ),
      ),
      onTap: press,
    );
  }
}
