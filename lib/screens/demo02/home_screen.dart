import 'package:flutter/material.dart';

import '../../widgets/demo02/home_widgets.dart';

class Demo02HomeScreen extends StatelessWidget {
  const Demo02HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              Stack(
                children: const [
                  TopWrapper(),
                ],
              ),
              const CenterWrapper(),
              const BottomWrapper(),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomWrapper extends StatelessWidget {
  const BottomWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Column(
        children: const [
          BottomHeader(),
          BottomContent(),
        ],
      ),
    );
  }
}

class CenterWrapper extends StatelessWidget {
  const CenterWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 35,
      ),
      child: useGrid(),
      // child: useColumn(),
    );
  }

  List<Widget> getButtons() {
    return [
      GestureDetector(
        child: menuWidgets('Flight', Icons.flight, Colors.purple),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Hotel', Icons.hotel, Colors.orange),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Train', Icons.train, Colors.yellow),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Bus', Icons.directions_bus, Colors.red),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Movies', Icons.movie, Colors.green),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Attractions', Icons.pages, Colors.red),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Taxi', Icons.local_taxi, Colors.blue),
        onTap: () {},
      ),
      GestureDetector(
        child: menuWidgets('Eats', Icons.confirmation_number, Colors.lightBlue),
        onTap: () {},
      )
    ];
  }

  Widget useGrid() {
    return GridView.count(
      shrinkWrap: true,
      mainAxisSpacing: 1,
      crossAxisSpacing: 1,
      crossAxisCount: 4,
      children: List.generate(getButtons().length, (index) {
        return getButtons()[index];
      }),
    );
  }

  Column useColumn() {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: menuWidgets('Flight', Icons.flight, Colors.purple),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets('Hotel', Icons.hotel, Colors.orange),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets('Train', Icons.train, Colors.yellow),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets('Bus', Icons.directions_bus, Colors.red),
            onTap: () {},
          )
        ],
      ),
      const SizedBox(
        height: 25,
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            child: menuWidgets('Movies', Icons.movie, Colors.green),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets('Attractions', Icons.pages, Colors.red),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets('Taxi', Icons.local_taxi, Colors.blue),
            onTap: () {},
          ),
          GestureDetector(
            child: menuWidgets(
                'Eats', Icons.confirmation_number, Colors.lightBlue),
            onTap: () {},
          )
        ],
      ),
    ]);
  }
}

class TopWrapper extends StatelessWidget {
  const TopWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: 60,
      // left: 25,
      child: Column(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 18.0, left: 10, right: 10),
            child: UserInfo(),
          ),
          TopButtonGroup(),
        ],
      ),
    );
  }
}
