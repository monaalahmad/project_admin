import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../color_app/color_app.dart';

class BackWidghtLogin extends StatefulWidget {
  const BackWidghtLogin({super.key});

  @override
  State<BackWidghtLogin> createState() => _BackWidghtLoginState();
}

class _BackWidghtLoginState extends State<BackWidghtLogin> {

  var _formkey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.secondary,
    // backgroundColor: ColorApp.whiteBrown,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: true,
                child: Stack(
                  children: [
                    Positioned(
                        left: -30,
                        right: 275,
                        top: -380,
                        bottom: 100,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        )),
                    Positioned(
                        left: 275,
                        right: -40,
                        top: 100,
                        bottom: -350,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Theme.of(context).colorScheme.tertiary,
                          ),
                        )),
                    Positioned(
                      left: 37,
                      right: 37,
                      top: 125,
                      bottom: 100,
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(40),
                          color: Theme.of(context).colorScheme.tertiaryContainer,
                        ),
                      ),
                    ),
                  ],
                ),
            ),
          ],
        ),
      ),
    );
  }
}
