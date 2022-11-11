import 'package:flutter/material.dart';

class UserTextInfo extends StatelessWidget {
  const UserTextInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: const TextStyle(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            "Ilona",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 8,
            ),
            child: Text(
              'Summer time, let\'s book a flight for \n vacation.',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UserAvatorInfo extends StatelessWidget {
  const UserAvatorInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 40,
      ),
      child: Material(
        borderRadius: BorderRadius.circular(
          40.0,
        ),
        elevation: 20,
        child: Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(
              40,
            ),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/demo02/people.jpeg'),
            ),
          ),
        ),
      ),
    );
  }
}

class UserInfo extends StatelessWidget {
  const UserInfo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: const [
        UserTextInfo(),
        UserAvatorInfo(),
      ],
    );
  }
}

class TopButton extends StatelessWidget {
  final String text;
  final Icon icon;
  const TopButton({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        elevation: 0,
        // foregroundColor: Colors.transparent,
      ),
      onPressed: () {},
      child: Container(
        width: 135,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            icon,
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class TopButtonGroup extends StatelessWidget {
  const TopButtonGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          TopButton(
            text: '1130 pts',
            icon: Icon(
              Icons.poll,
              color: Colors.yellow,
            ),
          ),
          SizedBox(
            width: 30,
          ),
          TopButton(
            text: '\$ 4600',
            icon: Icon(
              Icons.account_balance_wallet,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}

Widget menuWidgets(String text, IconData icon, MaterialColor color) {
  return Column(
    children: <Widget>[
      Container(
        width: 50.0,
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0), color: color),
        child: Center(
          child: Icon(icon),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          text,
          style: const TextStyle(color: Colors.white, fontSize: 15.0),
        ),
      )
    ],
  );
}

class BottomHeader extends StatelessWidget {
  const BottomHeader({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Text(
            'Recommmend',
            style: TextStyle(color: Colors.white, fontSize: 18.0),
          ),
          Text(
            'View more',
            style: TextStyle(color: Colors.pink, fontSize: 18.0),
          ),
        ],
      ),
    );
  }
}

class BottomCard extends StatelessWidget {
  final double width;
  final double height;
  final String img;
  final String title;
  final String btnText;
  final Color titleColor;

  const BottomCard({
    Key? key,
    required this.width,
    required this.height,
    required this.img,
    required this.title,
    required this.btnText,
    required this.titleColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage(img), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              title,
              style: TextStyle(
                  color: titleColor,
                  fontSize: 11.0,
                  fontWeight: FontWeight.bold),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink[300],
                ),
                onPressed: () {},
                child: Text(
                  btnText,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BottomContent extends StatelessWidget {
  const BottomContent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BottomCard(
                img: 'assets/demo02/operahouse.jpg',
                width: 150,
                height: 200,
                btnText: 'Book',
                title: 'Cheap Holiday Promo\nTo Australia',
                titleColor: Colors.black,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  BottomCard(
                    img: 'assets/demo02/macau.jpg',
                    width: 180,
                    height: 90,
                    btnText: 'Book',
                    title: 'Explore Macau for\nYour holiday',
                    titleColor: Colors.white,
                  ),
                  BottomCard(
                    img: 'assets/demo02/beach.jpg',
                    width: 180,
                    height: 90,
                    btnText: 'Book',
                    title: 'Cheap Holiday Promo\nTo Australia',
                    titleColor: Colors.white,
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
