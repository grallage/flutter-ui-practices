import 'package:flutter/material.dart';

import '../../widgets/demo02/ticket_widgets.dart';

class Demo02TicketScreen extends StatefulWidget {
  const Demo02TicketScreen({super.key});

  @override
  State<Demo02TicketScreen> createState() => _Demo02TicketScreenState();
}

class _Demo02TicketScreenState extends State<Demo02TicketScreen> {
  Widget ticketDetailsWidget(String firstTitle, String firstDesc,
      String secondTitle, String secondDesc) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left: 12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                firstTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  firstDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                secondTitle,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 4.0),
                child: Text(
                  secondDesc,
                  style: const TextStyle(
                    color: Colors.black,
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Scaffold(
        body: SafeArea(
          child: ListView(
            children: [
              Stack(
                alignment: Alignment.topCenter,
                children: [
                  // set Stack width and height
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                  ),
                  // Positioned.fill(
                  //   child: Container(
                  //     color: Colors.pink,
                  //     width: MediaQuery.of(context).size.width,
                  //     height: MediaQuery.of(context).size.height,
                  //   ),
                  // ),
                  // background
                  Padding(
                    padding: const EdgeInsets.only(top: 0.0),
                    child: Container(
                      // width: MediaQuery.of(context).size.width,
                      width: double.infinity,
                      height: 350.0,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/demo02/worldmap.jpg'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  // title
                  const Positioned(
                    top: 20.0,
                    child: TopTitle(),
                  ),
                  Positioned(
                    top: height * 0.15,
                    left: width * 0.15,
                    child: const AirlineIcon(),
                  ),
                  Positioned(
                    top: height * 0.18,
                    left: width * 0.11,
                    child: const AirlineText(
                      from: 'STM',
                      to: 'Sleman',
                    ),
                  ),
                  Positioned(
                    top: height * 0.18,
                    left: width * 0.78,
                    child: const AirlineText(
                      from: 'BTL',
                      to: 'Mbantul',
                    ),
                  ),
                  // bottom card
                  Positioned(
                    top: 300.0,
                    left: 30.0,
                    right: 30.0,
                    child: ClipPath(
                      clipper: MyClipper(),
                      child: Container(
                        // width: 200.0,
                        // height: 450.0,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: <Widget>[
                              // top wrapper
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    width: 120.0,
                                    height: 25.0,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30.0),
                                      border: Border.all(
                                          width: 1.0, color: Colors.green),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        'Business Class',
                                        style: TextStyle(color: Colors.green),
                                      ),
                                    ),
                                  ),
                                  Row(
                                    children: const <Widget>[
                                      Text(
                                        'SLM',
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Icon(
                                          Icons.flight_takeoff,
                                          color: Colors.pink,
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(left: 8.0),
                                        child: Text(
                                          'BTL',
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              // title
                              const Align(
                                alignment: Alignment.topLeft,
                                child: Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: Text(
                                    '4 Flight Tickets',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              // info content
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Column(
                                  children: <Widget>[
                                    ticketDetailsWidget('Passengers', 'Ilona',
                                        'Date', '24-12-2018'),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 40.0),
                                      child: ticketDetailsWidget(
                                          'Flight', '76836A45', 'Gate', '66B'),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          top: 12.0, right: 40.0),
                                      child: ticketDetailsWidget(
                                          'Class', 'Business', 'Seat', '21B'),
                                    ),
                                  ],
                                ),
                              ),
                              //  hr
                              Padding(
                                padding: const EdgeInsets.only(top: 25.0),
                                child: Container(
                                  width: double.infinity,
                                  height: 1.0,
                                  color: Colors.grey,
                                ),
                              ),
                              // qr code
                              Padding(
                                padding: const EdgeInsets.all(30.0),
                                child: Container(
                                  width: 250.0,
                                  height: 60.0,
                                  decoration: const BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              'assets/demo02/barcode.png'),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                    top: 10.0, left: 75.0, right: 75.0),
                                child: Text(
                                  '9824 0972 1742 1298',
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
