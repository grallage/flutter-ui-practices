import 'package:flutter/material.dart';

class Demo07IntroScreen extends StatelessWidget {
  const Demo07IntroScreen({super.key, required this.backgroundColor});

  final MaterialColor backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      child: Center(
        child: Text(
          backgroundColor.toString(),
        ),
      ),
    );
  }
}
