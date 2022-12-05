import 'package:flutter/widgets.dart';
import 'package:flutter_ui_practices/screens/demo01/home_screen.dart';
import 'package:flutter_ui_practices/screens/demo03/main_screen.dart';
import 'package:flutter_ui_practices/screens/demo05/main_screen.dart';
import 'package:flutter_ui_practices/screens/demo06/home_screen.dart';
import 'package:flutter_ui_practices/screens/demo07/onboarding_screen.dart';

import '../screens/demo02/home_screen.dart';
import '../screens/demo04/home_screens.dart';

List<Navigation> navigations = [
  Navigation(
      name: "Bill-Payments-Screen-UI",
      desc: "",
      screen: const Demo01HomeScreen()),
  Navigation(
      name: "Flight-App-Screens-UI",
      desc: "",
      screen: const Demo02HomeScreen()),
  Navigation(
      name: "Furniture-Screens-UI", desc: "", screen: const Demo03MainScreen()),
  Navigation(
      name: "Pet-Screens-UI", desc: "", screen: const Demo04HomeScreen()),
  Navigation(
      name: "Grocery-Shop-UI", desc: "", screen: const Demo05MainScreen()),
  Navigation(
      name: "Modern-Smart-Home-UI", desc: "", screen: const Demo06HomeScreen()),
  Navigation(
      name: "Page-Indicator-UI",
      desc: "",
      screen: const Demo07OnboardingScreen()),
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
