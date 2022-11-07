import 'package:flutter/material.dart';

class TopBackground extends StatelessWidget {
  const TopBackground({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: OrangeClipper(),
          child: Container(
            width: screenWidth,
            height: screenHeight - 250.0,
            decoration: const BoxDecoration(
              color: Colors.orange,
            ),
          ),
        ),
        ClipPath(
          clipper: BlackClipper(),
          child: Container(
            width: screenWidth - 230.0,
            height: screenHeight - 250.0,
            decoration: const BoxDecoration(
              color: Colors.grey,
            ),
          ),
        ),
        const Center(
          child: Text("body"),
        ),
      ],
    );
  }
}

class OrangeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();

    path.lineTo(width * 0.3, height - 50);
    path.lineTo(width, height);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class BlackClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    final height = size.height;
    Path path = Path();

    path.lineTo(0.0, height);
    path.lineTo(width * 0.5, height - 50.0);
    path.lineTo(width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}

class CardShadow extends StatelessWidget {
  const CardShadow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 30,
        color: Colors.white12,
        borderRadius: BorderRadius.circular(18.0),
        child: Container(
          width: 320,
          height: 330,
          decoration: BoxDecoration(
            color: Colors.white12,
            borderRadius: BorderRadius.circular(18),
          ),
        ),
      ),
    );
  }
}

class BillItem extends StatelessWidget {
  const BillItem({
    Key? key,
    required this.title,
    required this.subtitle,
    required this.price,
  }) : super(key: key);
  final String title;
  final String subtitle;
  final String price;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // success icon
      leading: const Icon(
        Icons.check_circle,
        color: Colors.green,
        size: 35,
      ),
      title: Text(
        title,
        style: const TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          fontSize: 15,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          color: Colors.grey,
          fontWeight: FontWeight.bold,
          fontSize: 12,
        ),
      ),
      trailing: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Text(
          price,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClipPath(
        clipper: ZigZagClipper(),
        child: Container(
          width: 330,
          height: 530,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(18.0),
          ),
          child: Column(
            children: [
              // Logo Icon
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/demo01/dart.jpg'))),
                ),
              ),
              // title
              const Text(
                "Success!",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
              // subtitle
              const Padding(
                padding: EdgeInsets.only(top: 4),
                child: Text(
                  "Payment is completed for 2 bills.",
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
              ),
              // bills info
              Padding(
                padding: const EdgeInsets.only(top: 12),
                child: Container(
                  width: 300,
                  height: 150,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Column(children: [
                    const BillItem(
                      title: "KenZen Power",
                      subtitle: "Txn ID: 34374287",
                      price: "\$1240.00",
                    ),
                    // hr
                    Container(
                      width: 300,
                      height: 1,
                      color: Colors.grey,
                    ),
                    const BillItem(
                      title: 'Total Gas',
                      subtitle: "Txn ID: 64234285",
                      price: "\$1490.00",
                    ),
                  ]),
                ),
              ),
              // bottom info
              const Padding(
                padding: EdgeInsets.only(
                  top: 40,
                ),
                child: Text(
                  "Total AMount",
                  style: TextStyle(
                    color: Colors.grey,
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
              ),
              // total price
              const Padding(
                padding: EdgeInsets.only(top: 8),
                child: Text(
                  "\$2730.00",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Button extends StatelessWidget {
  const Button({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(40),
            color: Colors.indigo[700],
          ),
          width: 40,
          height: 40,
          child: Center(
              child: Icon(
            icon,
            color: Colors.white,
            size: 20,
          )),
        ),
        Text(
          text,
          style: TextStyle(
            color: Colors.indigo[700],
            fontSize: 12,
          ),
        )
      ],
    );
  }
}

class ZigZagClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(3.0, size.height - 10.0);

    var firstControlPoint = Offset(23.0, size.height - 40.0);
    var firstEndPoint = Offset(38.0, size.height - 5.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondControlPoint = Offset(58.0, size.height - 40.0);
    var secondEndPoint = Offset(75.0, size.height - 5.0);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    var thirdControlPoint = Offset(93.0, size.height - 40.0);
    var thirdEndPoint = Offset(110.0, size.height - 5.0);
    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    var fourthControlPoint = Offset(128.0, size.height - 40.0);
    var fourthEndPoint = Offset(150.0, size.height - 5.0);
    path.quadraticBezierTo(fourthControlPoint.dx, fourthControlPoint.dy,
        fourthEndPoint.dx, fourthEndPoint.dy);

    var fifthControlPoint = Offset(168.0, size.height - 40.0);
    var fifthEndPoint = Offset(185.0, size.height - 5.0);
    path.quadraticBezierTo(fifthControlPoint.dx, fifthControlPoint.dy,
        fifthEndPoint.dx, fifthEndPoint.dy);

    var sixthControlPoint = Offset(205.0, size.height - 40.0);
    var sixthEndPoint = Offset(220.0, size.height - 5.0);
    path.quadraticBezierTo(sixthControlPoint.dx, sixthControlPoint.dy,
        sixthEndPoint.dx, sixthEndPoint.dy);

    var sevenControlPoint = Offset(240.0, size.height - 40.0);
    var sevenEndPoint = Offset(255.0, size.height - 5.0);
    path.quadraticBezierTo(sevenControlPoint.dx, sevenControlPoint.dy,
        sevenEndPoint.dx, sevenEndPoint.dy);

    var eightControlPoint = Offset(275.0, size.height - 40.0);
    var eightEndPoint = Offset(290.0, size.height - 5.0);
    path.quadraticBezierTo(eightControlPoint.dx, eightControlPoint.dy,
        eightEndPoint.dx, eightEndPoint.dy);

    var ninthControlPoint = Offset(310.0, size.height - 40.0);
    var ninthEndPoint = Offset(330.0, size.height - 5.0);
    path.quadraticBezierTo(ninthControlPoint.dx, ninthControlPoint.dy,
        ninthEndPoint.dx, ninthEndPoint.dy);

    path.lineTo(size.width, size.height - 10.0);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
