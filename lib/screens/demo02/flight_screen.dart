import 'package:flutter/material.dart';

import '../../widgets/demo02/flight_widgets.dart';

class Demo02FlightScreen extends StatefulWidget {
  const Demo02FlightScreen({super.key});

  @override
  State<Demo02FlightScreen> createState() => _Demo02FlightScreenState();
}

class _Demo02FlightScreenState extends State<Demo02FlightScreen> {
  Color oneWayContainerColor = Colors.white;
  Color twoWayContainerColor = Colors.purple;
  Color oneWayTextColor = Colors.grey;
  Color twoWayTextColor = Colors.white;
  bool value = true;
  final classes = ["Business", "Economy"];
  String dropdownValue = "Business";

  Widget tripDetailsWidget(bool value) {
    var twoWay = Container(
        // width: 350.0,
        height: 300.0,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            flightDetailsWidget(Icons.date_range, 'Departure Date', 0,
                subtitle: 'Mon, 14 Dec'),
            flightDetailsWidget(Icons.date_range, 'Arrival Date', 1,
                subtitle: 'Sun, 15 Dec'),
            flightDetailsWidget(Icons.people, 'Passenger', 2,
                subtitle: '1 Adult 0 Child 0 Infant'),
            flightDetailsWidget(
              Icons.people,
              'Class',
              3,
              // subtitle: "Business",
            ),
          ],
        ));
    var oneWay = Container(
        // width: 350.0,
        height: 300.0,
        color: Colors.white,
        child: Column(
          children: <Widget>[
            flightDetailsWidget(Icons.date_range, 'Departure Date', 0,
                subtitle: 'Mon, 14 Dec'),
            flightDetailsWidget(Icons.people, 'Passenger', 2,
                subtitle: '1 Adult 0 Child 0 Infant'),
            flightDetailsWidget(
              Icons.people,
              'Class',
              3,
              // subtitle: "Business",
            ),
          ],
        ));
    return Material(
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 12,
        ),
        child: value == true ? twoWay : oneWay,
      ),
    );
  }

  Widget flightDetailsWidget(IconData icon, String title, int index,
      {String subtitle = ""}) {
    var dropdownButton = DropdownButton<String>(
      items: classes.map(
        (String dropDownStringItem) {
          return DropdownMenuItem<String>(
            value: dropDownStringItem,
            child: Text(
              dropDownStringItem,
            ),
          );
        },
      ).toList(),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      style: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
      value: dropdownValue,
    );

    var subtitleWidget = Text(
      subtitle,
      style: const TextStyle(
        color: Colors.grey,
        fontWeight: FontWeight.bold,
        fontSize: 16.0,
      ),
    );

    return ListTile(
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
      ),
      subtitle: index == 3 ? dropdownButton : subtitleWidget,
      leading: Icon(
        icon,
        color: Colors.grey,
      ),
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
              // top wrapper
              SizedBox(
                height: 400,
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    // background
                    Padding(
                      padding: const EdgeInsets.only(top: 0.0),
                      child: Container(
                        // width: MediaQuery.of(context).size.width,
                        height: 350.0,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/demo02/worldmap.jpg'),
                            // fit: BoxFit.cover,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    // title
                    const Positioned(
                      top: 15.0,
                      child: Text(
                        'Search Flight',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                    ),
                    //
                    Positioned(
                      top: height * 0.07,
                      left: width * 0.17,
                      child: const TopLeftAirline(),
                    ),
                    Positioned(
                      top: height * 0.17,
                      left: width * 0.51,
                      child: const TopRightAirline(),
                    ),
                    // button group
                    Positioned(
                      top: 330.0,
                      left: 20.0,
                      right: 20.0,
                      child: Container(
                        width: 145.0,
                        height: 55.0,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(30.0)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            GestureDetector(
                              onTap: () {
                                debugPrint("Tapped");

                                setState(() {
                                  oneWayContainerColor = Colors.purple;
                                  twoWayContainerColor = Colors.white;
                                  twoWayTextColor = Colors.grey;
                                  oneWayTextColor = Colors.white;
                                  value = false;
                                });
                              },
                              child: OneWayBtn(
                                  oneWayContainerColor: oneWayContainerColor,
                                  oneWayTextColor: oneWayTextColor),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  oneWayContainerColor = Colors.white;
                                  twoWayContainerColor = Colors.purple;
                                  twoWayTextColor = Colors.white;
                                  oneWayTextColor = Colors.grey;
                                  value = true;
                                });
                              },
                              child: TwoWayBtn(
                                  twoWayContainerColor: twoWayContainerColor,
                                  twoWayTextColor: twoWayTextColor),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // center wrapper
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: tripDetailsWidget(value),
              ),
              // bottom wrapper
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 8.0,
                  horizontal: 20.0,
                ),
                child: SearchFlightBtn(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
