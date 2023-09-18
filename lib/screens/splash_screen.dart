import 'package:animate_do/animate_do.dart';
import 'package:breaking_bad/widgets/widgets.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BBLogo(),
        ],
      )
    );
  }
}