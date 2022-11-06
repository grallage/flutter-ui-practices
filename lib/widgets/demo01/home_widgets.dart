import 'package:flutter/material.dart';

class TopButton extends StatelessWidget {
  const TopButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(40.0),
      child: Container(
        width: 45,
        height: 45,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(40.0),
        ),
        child: const Center(
          child: Icon(Icons.more, color: Colors.white, size: 18.0),
        ),
      ),
    );
  }
}

class TopBackground extends StatelessWidget {
  const TopBackground({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    return TopBg(screenWidth: screenWidth, screenHeight: screenHeight);
  }
}

class TopInfo extends StatelessWidget {
  const TopInfo({super.key});

  @override
  Widget build(BuildContext context) {
    var topTextStyle = const TextStyle(color: Colors.white);
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "My Bills",
              style: topTextStyle.copyWith(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 50.0),
              child: Text(
                "Total Bills Due",
                style: topTextStyle.copyWith(
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "\$3710.00",
                style: topTextStyle.copyWith(
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopBg extends StatelessWidget {
  const TopBg({
    Key? key,
    required this.screenWidth,
    required this.screenHeight,
  }) : super(key: key);

  final double screenWidth;
  final double screenHeight;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ClipPath(
        clipper: OrangeClipper(),
        child: Container(
          width: screenWidth,
          height: screenHeight - 600,
          decoration: const BoxDecoration(color: Colors.orange),
        ),
      ),
      ClipPath(
        clipper: BlackClipper(),
        child: Container(
          width: screenWidth,
          height: screenHeight - 600,
          decoration: BoxDecoration(color: Colors.grey[600]),
        ),
      ),
    ]);
  }
}

class OrangeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final width = size.width;
    // final height = size.height;
    const height = 200.0;
    debugPrint('OrangeClipper width ${width.toString()},'
        'OrangeClipper height: ${height.toString()}');
    Path path = Path();
    // from left top to left bottom
    path.lineTo(0.0, height);
    // path.lineTo(width / 2 + 85.0, height);
    final px0 = width * 0.25 * 3;
    final px1 = px0 + (width - px0) / 2;
    final px2 = width - 1.0;

    path.lineTo(px0, height);

    var firstControlPoint = Offset(px1, height - 105.0);
    var firstEndPoint = Offset(px2, height);

    // 贝塞尔曲线, 貝茲曲線
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

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
    // final height = size.height;
    const height = 200.0;
    Path path = Path();
    path.lineTo(0.0, height);
    final px0 = width / 2 - 30.0;
    final px1 = width / 2 + 175.0;
    final px2 = width / 2;
    path.lineTo(px0, height);

    var firstControlPoint = Offset(px1, height / 2 - 30.0);
    var firstEndPoint = Offset(px2, 0.0);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.lineTo(width / 2 + 75.0, height / 2 - 30.0);

    path.lineTo(width / 2, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class ItemCard extends StatelessWidget {
  final BuildContext context;
  final String image;
  final String title;
  final String subtitle;
  final String desc;
  final String amount;
  final String days;
  final Color color;

  const ItemCard(
      {super.key,
      required this.context,
      required this.image,
      required this.title,
      required this.subtitle,
      required this.desc,
      required this.amount,
      required this.days,
      required this.color});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Material(
      borderRadius: BorderRadius.circular(18.0),
      elevation: 2.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(18.0),
        ),
        width: width - 25.0 * 2,
        child: Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // left first row
                    ListTile(
                      title: Text(
                        title,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                      leading: Container(
                        width: 40.0,
                        height: 40.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage(image),
                          ),
                          borderRadius: BorderRadius.circular(10.0),
                          border: Border.all(
                            color: Colors.black,
                            width: 1,
                          ),
                        ),
                      ),
                      trailing: Container(
                        width: 80.0,
                        height: 25.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.grey[300],
                        ),
                        child: const Center(
                          child: Text(
                            'Select',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                    // left second row
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 12.0,
                        right: 12.0,
                        bottom: 12.0,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // desc
                          Text(
                            desc,
                            style: TextStyle(
                              decoration: TextDecoration.underline,
                              color: color,
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Column(
                            children: [
                              // amount
                              Text(
                                amount,
                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              // days
                              Text(
                                days,
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 13.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // right ornamnent
              Container(
                width: 5.0,
                height: 45.0,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
            ],
          ),
        ),
        // Image.asset(image, width: 20)
      ),
    );
  }
}
