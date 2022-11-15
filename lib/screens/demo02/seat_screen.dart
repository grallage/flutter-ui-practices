import 'package:flutter/material.dart';

import '../../widgets/demo02/seat_widgets.dart';

class Demo02SeatScreen extends StatefulWidget {
  const Demo02SeatScreen({super.key});

  @override
  State<Demo02SeatScreen> createState() => _Demo02SeatScreenState();
}

class _Demo02SeatScreenState extends State<Demo02SeatScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: getDemo02SeatAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  children: [
                    const Demo02Title(
                      title: 'Business Class',
                    ),
                    seatWidget(),
                    seatWidget(top: 15),
                    seatWidget(top: 15),
                    const Padding(
                      padding: EdgeInsets.only(top: 20.0),
                      child: Demo02Title(
                        title: 'Economy Class',
                      ),
                    ),
                    ...List.filled(6, 0).map((e) => seatWidget(top: 15)),
                    const Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: BottomCard(),
                    ),
                  ],
                ),
              ),
              // const Padding(
              //   padding: EdgeInsets.only(top: 15.0),
              //   child: BottomCard(),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
