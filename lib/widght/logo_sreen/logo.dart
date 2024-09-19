import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async'; // Import for Timer

import '../../shard/color_app/color_app.dart';

class LogoPage extends StatefulWidget {
  @override
  _LogoPageState createState() => _LogoPageState();
}

class _LogoPageState extends State<LogoPage> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacementNamed(context, '/Login');
    });
  }

  @override
  void dispose() {
    _timer?.cancel(); // Cancel the timer when the widget is disposed
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorApp.white,
      body: Center(
        child: Image.asset(
          'assets/images/photo_2024-06-30_11-23-30.jpg',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
