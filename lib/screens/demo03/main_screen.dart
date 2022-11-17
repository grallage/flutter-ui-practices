import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo03/home_screen.dart';
import 'package:flutter_ui_practices/widgets/demo03/custom_nav_bar.dart';

class Demo03MainScreen extends StatefulWidget {
  const Demo03MainScreen({super.key});

  @override
  State<Demo03MainScreen> createState() => _Demo03MainScreenState();
}

class _Demo03MainScreenState extends State<Demo03MainScreen> {
  int _currentIndex = 0;
  final inactiveColor = Colors.grey;
  Widget _getBody() {
    List<Widget> pages = [
      const Demo03HomeScreen(),
      // const Demo03ProductDetailScreen(),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Products",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Messages",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
      Container(
        alignment: Alignment.center,
        child: const Text(
          "Settings",
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
        ),
      ),
    ];
    return IndexedStack(
      index: _currentIndex,
      children: pages,
    );
  }

  Widget _buildBottomBar() {
    return CustomAnimatedBottomBar(
      containerHeight: 70,
      backgroundColor: Colors.white, // Colors.black
      selectedIndex: _currentIndex,
      showElevation: false,
      itemCornerRadius: 24,
      curve: Curves.easeIn,
      // onItemSelected: (index) => setState(() => currentIndex = index),
      onItemSelected: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      items: <BottomNavyBarItem>[
        BottomNavyBarItem(
          icon: const Icon(Icons.event_seat),
          title: const Text('Home'),
          activeColor: Colors.green,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.timer),
          title: const Text('Products'),
          activeColor: Colors.purpleAccent,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.shopping_cart),
          title: const Text(
            'Shopping Cart',
          ),
          activeColor: Colors.pink,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
        BottomNavyBarItem(
          icon: const Icon(Icons.person_outline),
          title: const Text('Settings'),
          activeColor: Colors.blue,
          inactiveColor: inactiveColor,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: TabBar01(),
      // home: TabBar02(),
      home: Scaffold(
        body: _getBody(),
        bottomNavigationBar: _buildBottomBar(),
      ),
    );
  }
}
