import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/widgets/demo04/home_widgets.dart';

class Demo04HomeScreen extends StatefulWidget {
  const Demo04HomeScreen({super.key});

  @override
  State<Demo04HomeScreen> createState() => _Demo04HomeScreenState();
}

class _Demo04HomeScreenState extends State<Demo04HomeScreen> {
  List<String> items = ['Cats', 'Dogs', 'Birds', 'Others'];
  var _selectedIndex = 1;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                ...getTopWrapper(),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, left: 40.0, right: 20.0),
                  child: SizedBox(
                    height: 70.0,
                    // width: 300.0,
                    child: Row(
                      children: <Widget>[
                        const Icon(
                          Icons.storage,
                          color: Colors.black,
                          size: 30.0,
                        ),
                        Expanded(
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: items.length,
                            itemBuilder: (context, index) {
                              return PetTabItem(
                                index: index,
                                selectedIndex: _selectedIndex,
                                items: items,
                                onTap: () {
                                  setState(() {
                                    _selectedIndex = index;
                                  });
                                },
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 80.0, left: 35.0),
                  child: getSubSectionPage(_selectedIndex),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
