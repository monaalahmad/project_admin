import 'package:flutter/material.dart';
import '../shard/color_app/color_app.dart';

ThemeData lightMode = ThemeData(
  brightness: Brightness.light,
  colorScheme: ColorScheme.light(
    background: Colors.white,
    primaryContainer : Colors.black,
    primary: ColorApp.BrownChocola,
    secondary: Colors.brown,
    tertiary: ColorApp.darkGreen,
    tertiaryContainer: ColorApp.beigeWhite,
  ),
);

ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade900,
    primaryContainer : Colors.white,
    primary: Colors.grey.shade800,
    secondary: Colors.grey.shade700,
    tertiary: ColorApp.green,
    tertiaryContainer: ColorApp.greyWhite,

  ),
);

