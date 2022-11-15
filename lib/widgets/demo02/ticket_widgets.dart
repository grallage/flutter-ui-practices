import 'package:flutter/material.dart';

class TopTitle extends StatelessWidget {
  const TopTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'E-Ticket',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 20.0,
      ),
    );
  }
}

class AirlineIcon extends StatelessWidget {
  const AirlineIcon({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: 6.0,
          height: 6.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
        ),
        Container(
          width: 120.0,
          height: 1.0,
          color: Colors.white,
        ),
        const Icon(
          Icons.flight_takeoff,
          color: Colors.white,
          size: 30.0,
        ),
        Container(
          width: 120.0,
          height: 1.0,
          color: Colors.white,
        ),
        Container(
          width: 8.0,
          height: 8.0,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40.0),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class AirlineText extends StatelessWidget {
  final String from;
  final String to;

  const AirlineText({
    Key? key,
    required this.from,
    required this.to,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            from,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Text(
            to,
            style: const TextStyle(color: Colors.white, fontSize: 14.0),
          ),
        )
      ],
    );
  }
}

class MyClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0.0, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0.0);
    path.addOval(Rect.fromCircle(
        center: Offset(0.0, size.height / 2 + 50.0), radius: 20.0));
    path.addOval(Rect.fromCircle(
        center: Offset(size.width, size.height / 2 + 50.0), radius: 20.0));

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
