import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo05/intro_screen.dart';
import 'package:flutter_ui_practices/screens/demo05/models/cart_model.dart';
import 'package:provider/provider.dart';

class Demo05MainScreen extends StatelessWidget {
  const Demo05MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {
        return CartModel();
      },
      child: const MaterialApp(
        home: Demo05IntroScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
