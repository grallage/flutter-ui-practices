import 'package:flutter/material.dart';

import '../../widgets/demo01/detail_widgets.dart';

class Demo01DetailScreen extends StatelessWidget {
  const Demo01DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Stack(
        children: [
          TopBackground(screenWidth: screenWidth, screenHeight: screenHeight),
          const CardShadow(),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // main card
              const MainContent(),
              // btn group
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: const [
                    Button(
                      text: "Share",
                      icon: Icons.share,
                    ),
                    Button(
                      text: "Print",
                      icon: Icons.print,
                    ),
                  ],
                ),
              ),
              // Button button
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: InkWell(
                  splashColor: Colors.red,
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 300.0,
                    height: 50.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        12.0,
                      ),
                      border: Border.all(
                        color: Colors.indigo,
                        width: 1.5,
                      ),
                      color: Colors.white,
                    ),
                    child: Center(
                      child: Text(
                        'Done',
                        style: TextStyle(
                          color: Colors.indigo[700],
                          fontSize: 15.0,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
