import 'package:flutter/widgets.dart';
import 'package:flutter_ui_practices/screens/demo01/home_screen.dart';

import '../screens/demo02/home_screen.dart';

List<Navigation> navigations = [
  Navigation(
      name: "Bill-Payments-Screen-UI",
      desc: "",
      screen: const Demo01HomeScreen()),
  Navigation(
      name: "Flight-App-Screens-UI",
      desc: "",
      screen: const Demo02HomeScreen()),
];

class Navigation {
  String name;
  String desc;
  Widget screen;
  Navigation({
    required this.name,
    required this.desc,
    required this.screen,
  });
}
