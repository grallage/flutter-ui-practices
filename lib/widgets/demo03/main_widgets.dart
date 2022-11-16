import 'package:flutter/material.dart';

class TabBar01 extends StatefulWidget {
  const TabBar01({super.key});

  @override
  State<TabBar01> createState() => _TabBar01State();
}

class _TabBar01State extends State<TabBar01>
    with SingleTickerProviderStateMixin {
  // type1: use tab bar
  late TabController _tabController;
  static const List<Tab> pageTabs = <Tab>[
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
    Tab(text: 'LEFT'),
    Tab(text: 'RIGHT'),
  ];

  static const List<Tab> iconTabs = <Tab>[
    Tab(icon: Icon(Icons.event_seat, color: Colors.grey)),
    Tab(icon: Icon(Icons.timer, color: Colors.grey)),
    Tab(icon: Icon(Icons.shopping_cart, color: Colors.grey)),
    Tab(icon: Icon(Icons.person_outline, color: Colors.grey))
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: pageTabs.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var tabBarView = TabBarView(
      controller: _tabController,
      children: pageTabs,
    );
    var tabBar = Material(
      color: Colors.white, // background
      child: TabBar(
        controller: _tabController,
        tabs: iconTabs,
        indicatorColor: Colors.yellow,
        indicatorSize: TabBarIndicatorSize.tab,
        indicatorWeight: 5.0,
      ),
    );

    return Scaffold(
      // type1: use tab bar
      body: tabBarView,
      bottomNavigationBar: tabBar,
    );
  }
}

class TabBar02 extends StatefulWidget {
  const TabBar02({super.key});

  @override
  State<TabBar02> createState() => _TabBar02State();
}

class _TabBar02State extends State<TabBar02> {
  // type2: use bottom navigation bar
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text('Index 0: Home', style: optionStyle),
    Text('Index 1: Business', style: optionStyle),
    Text('Index 2: School', style: optionStyle),
    Text('Index 3: School', style: optionStyle),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    var bottomNavigationBar = BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.event_seat), label: 'page 1'),
        BottomNavigationBarItem(icon: Icon(Icons.timer), label: 'page 2'),
        BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), label: 'page 3'),
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'page 4'),
      ],
      currentIndex: _selectedIndex,
      selectedItemColor: Colors.grey,
      unselectedItemColor: Colors.grey,
      // fixedColor: Colors.grey,
      backgroundColor: Colors.white,
      elevation: 0,
      iconSize: 24,
      selectedFontSize: 14,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      type: BottomNavigationBarType.fixed, // shifting
      onTap: _onItemTapped,
    );

    return Scaffold(
      // type2: use bottom navigation bar
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: bottomNavigationBar,
    );
  }
}
