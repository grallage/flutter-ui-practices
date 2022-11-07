import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo01/detail_screen.dart';
import 'package:flutter_ui_practices/widgets/demo01/home_widgets.dart';

class Demo01HomeScreen extends StatelessWidget {
  const Demo01HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    debugPrint('screenWidth $screenWidth, screenHeight: $screenHeight');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bill Payments Screen",
      home: Scaffold(
        appBar: null,
        body: Column(
          children: [
            Stack(
              children: const [
                // top background
                TopBackground(),
                TopInfo(),
                Positioned(
                  right: 27,
                  top: 155,
                  child: TopButton(),
                ),
              ],
            ),
            // main content
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Column(children: [
                ItemCard(
                  context: context,
                  image: "assets/demo01/kengenlogo.jpeg",
                  title: "KenGen Power",
                  subtitle: 'ID: 123456789',
                  desc: 'Auto Pay on 24th May 18',
                  amount: '\$1240.00',
                  days: 'Due in 3 days',
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                ItemCard(
                  context: context,
                  image: "assets/demo01/totallogo.jpg",
                  title: 'Total Gas',
                  subtitle: 'ID: 123456789',
                  desc: 'Enable Auto Pay',
                  amount: '\$1490.00',
                  days: 'Due in 2 days',
                  color: Colors.grey,
                ),
                const SizedBox(height: 12),
                ItemCard(
                  context: context,
                  image: "assets/demo01/airtellogo.png",
                  title: 'Airtel Broadband',
                  subtitle: 'ID: 123456789',
                  desc: 'Enable Auto Pay',
                  amount: '\$1000.00',
                  days: 'Due in 3 days',
                  color: Colors.grey,
                ),
              ]),
            ),
            // bottom content
            Padding(
              padding: const EdgeInsets.only(top: 50.0),

              /// FlatButton → TextButton
              /// RaisedButton → ElevatedButton
              /// OutlineButton → OutlinedButton
              /// ButtonTheme → TextButtonTheme, ElevatedButtonTheme, OutlineButtonTheme

              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.indigo[700],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ),
                  // side: const BorderSide(color: Colors.red, width: 5),
                ),

                // style: ButtonStyle(
                //   backgroundColor:
                //       MaterialStateProperty.all<Color>(Colors.indigo[700]!),
                //   shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                //       RoundedRectangleBorder(
                //     borderRadius:
                //         BorderRadius.circular(18.0), // radius you want
                //     side: const BorderSide(
                //       color: Colors.transparent, //color
                //     ),
                //   )),
                // ),
                onPressed: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Demo01DetailScreen(),
                    ),
                  )
                },
                child: const Padding(
                  padding: EdgeInsets.only(
                    left: 60.0,
                    right: 60.0,
                    top: 15.0,
                    bottom: 15.0,
                  ),
                  child: Text(
                    "Pay all bills",
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
