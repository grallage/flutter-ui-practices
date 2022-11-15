import 'package:flutter/material.dart';

AppBar getDemo02SeatAppBar() {
  return AppBar(
    elevation: 0.0,
    centerTitle: true,
    backgroundColor: Colors.black12,
    title: const Text(
      "Select Seat",
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  );
}

class Demo02Title extends StatelessWidget {
  const Demo02Title({
    Key? key,
    this.title,
  }) : super(key: key);
  final title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16.0,
        ),
      ),
    );
  }
}

Widget seatWidget({double top = 0}) {
  return Padding(
    padding: EdgeInsets.only(top: 10.0 + top, right: 20.0, left: 20.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        // repeate 6 Icon widgets
        ...List.filled(6, 0)
            .map(
              (i) => const Icon(
                Icons.airline_seat_recline_normal,
                color: Colors.white,
              ),
            )
            .toList(),
      ],
    ),
  );
}

class BottomCard extends StatelessWidget {
  const BottomCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity, // MediaQuery.of(context).size.width
      height: 180.0,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text(
              'Selected Seat',
              style: TextStyle(color: Colors.grey),
            ),
            subtitle: const Text(
              '15A, 16F, 16E',
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0),
            ),
            leading: const Icon(
              Icons.airline_seat_legroom_extra,
              color: Colors.grey,
            ),
            trailing: Container(
              width: 130.0,
              height: 35.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'Business Class',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: 18.0,
              right: 18.0,
              top: 15.0,
            ),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.pink,
                  fixedSize: const Size(double.infinity, 60),
                ),
                onPressed: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: ((context) {
                  //       return TicketScreen();
                  //     }),
                  //   ),
                  // );
                },
                child: const Text(
                  'Purchase',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
