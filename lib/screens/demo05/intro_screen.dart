import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo05/home_screen.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo05IntroScreen extends StatelessWidget {
  const Demo05IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //  logo
          Padding(
            padding: const EdgeInsets.all(80.0),
            child: Image.asset('assets/demo05/avocado.png'),
          ),
          // we deliver groceries at your doorstep
          Padding(
            padding: const EdgeInsets.only(
                left: 80, right: 80, bottom: 40, top: 120),
            child: Text(
              'We deliver groceries at your doorstep',
              textAlign: TextAlign.center,
              style: GoogleFonts.notoSerif(
                fontSize: 36,
                fontWeight: FontWeight.bold,
              ),
              // style: TextStyle(
              //   fontSize: 40,
              //   fontWeight: FontWeight.bold,
              // ),
            ),
          ),
          // fresh items everyday
          const SizedBox(
            height: 24,
          ),
          Text(
            "Fresh items everyday",
            style: TextStyle(color: Colors.grey[600]),
          ),

          const Spacer(),
          // get started button
          GestureDetector(
            onTap: () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) {
              // return Provider(
              //   create: (BuildContext context) => CartModel(),
              //   builder: (context, child) => const Demo05HomeScreen(),
              // );
              return const Demo05HomeScreen();
            })),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
                borderRadius: BorderRadius.circular(12),
              ),
              padding: const EdgeInsets.all(24),
              child: const Text(
                "Get Started",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
