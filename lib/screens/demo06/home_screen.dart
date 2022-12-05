import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo06/smart_device_box.dart';
import 'package:google_fonts/google_fonts.dart';

class Demo06HomeScreen extends StatefulWidget {
  const Demo06HomeScreen({super.key});

  @override
  State<Demo06HomeScreen> createState() => _Demo06HomeScreenState();
}

class _Demo06HomeScreenState extends State<Demo06HomeScreen> {
  final double horizontalPadding = 40;
  final double verticalPadding = 25;

  List mySmartDevices = [
    // [ smartDeviceName, iconPath, powerStatus ]
    ["Smart Light", "assets/demo06/light-bulb.png", true],
    ["Smart AC", "assets/demo06/air-conditioner.png", false],
    ["Smart TV", "assets/demo06/smart-tv.png", false],
    ["Smart Fan", "assets/demo06/fan.png", false],
  ];
  @override
  Widget build(BuildContext context) {
    // power button switched
    void powerSwitchChanged(bool value, int index) {
      setState(() {
        mySmartDevices[index][2] = value;
      });
    }

    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // custom app bar
            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: horizontalPadding,
                vertical: verticalPadding,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'assets/demo06/menu.png',
                    height: 45,
                    color: Colors.grey[800],
                  ),
                  Icon(
                    Icons.person,
                    size: 45,
                    color: Colors.grey[800],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            // welcome home MITCH KOKO
            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Welcome Home,",
                    style: TextStyle(fontSize: 20, color: Colors.grey.shade800),
                  ),
                  Text(
                    "Garret Reynolds",
                    style: GoogleFonts.bebasNeue(
                      fontSize: 55,
                    ),
                    // style: TextStyle(
                    //   fontSize: 40,
                    // ),
                  ),
                ],
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 25),
              child: Divider(
                thickness: 1,
                color: Colors.grey,
              ),
            ),

            // smart devices + grid

            Padding(
              padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
              child: Text(
                "Smart Devices",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: Colors.grey.shade800,
                ),
              ),
            ),

            Expanded(
              child: GridView.builder(
                // physics: const NeverScrollableScrollPhysics(),
                itemCount: mySmartDevices.length,
                padding: const EdgeInsets.all(
                  25,
                ), // Demo06SmartDeviceBox padding = 15, total 40
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.3,
                ),
                itemBuilder: ((context, index) {
                  return Demo06SmartDeviceBox(
                    smartDeviceName: mySmartDevices[index][0],
                    iconPath: mySmartDevices[index][1],
                    powerOn: mySmartDevices[index][2],
                    onChanged: (value) => powerSwitchChanged(value, index),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
