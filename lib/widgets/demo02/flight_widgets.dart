import 'package:flutter/material.dart';

class TopLeftAirline extends StatelessWidget {
  const TopLeftAirline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Column(
          children: <Widget>[
            Container(
              width: 6.0,
              height: 6.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(40.0),
                color: Colors.white,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                width: 2.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                width: 30.0,
                height: 30.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.transparent,
                  border: Border.all(color: Colors.white, width: 1.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                width: 2.0,
                height: 70.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12.0),
                  color: Colors.white,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 2.0),
              child: Container(
                width: 6.0,
                height: 6.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.0),
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const <Widget>[
              Text(
                'Departure From',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  'SLM',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  'Sleman,Yogyakarta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 70.0),
                child: Text(
                  'Arrival At',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  'BTL',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
                child: Text(
                  'Mbantul,Yogyakarta',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14.0,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class TopRightAirline extends StatelessWidget {
  const TopRightAirline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
        ),
        Container(
          width: 50.0,
          height: 1.0,
          color: Colors.white,
        ),
        const Icon(
          Icons.flight_takeoff,
          color: Colors.white,
          size: 25.0,
        ),
        Container(
          width: 50.0,
          height: 1.0,
          color: Colors.white,
        ),
        Container(
          width: 10.0,
          height: 10.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height - 20.0);
    path.quadraticBezierTo(size.width / 2.0, 20.0, size.width, 0.0);
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);

    path.lineTo(size.width, 0.0);

    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class TwoWayBtn extends StatelessWidget {
  const TwoWayBtn({
    Key? key,
    required this.twoWayContainerColor,
    required this.twoWayTextColor,
  }) : super(key: key);

  final Color twoWayContainerColor;
  final Color twoWayTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: twoWayContainerColor,
      ),
      child: Center(
        child: Text(
          'Two Way',
          style: TextStyle(color: twoWayTextColor),
        ),
      ),
    );
  }
}

class OneWayBtn extends StatelessWidget {
  const OneWayBtn({
    Key? key,
    required this.oneWayContainerColor,
    required this.oneWayTextColor,
  }) : super(key: key);

  final Color oneWayContainerColor;
  final Color oneWayTextColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130.0,
      height: 45.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: oneWayContainerColor,
      ),
      child: Center(
        child: Text(
          'One Way',
          style: TextStyle(color: oneWayTextColor),
        ),
      ),
    );
  }
}

class SearchFlightBtn extends StatelessWidget {
  const SearchFlightBtn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.pink[300],
          fixedSize: const Size(double.infinity, 50),
        ),
        onPressed: () {
          // Navigator.push(context,
          //     new MaterialPageRoute(builder: ((context) {
          //   return SeatScreen();
          // })));
        },
        child: const Text(
          'Search Flight',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}
