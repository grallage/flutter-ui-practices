import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/data/navigation.dart';
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat('###00');

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Collection of various UI screens",
      home: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text("Collection of various UI screens"),
          ),
        ),
        body: ListView.builder(
            itemCount: navigations.length,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  // trailing: null,
                  leading:
                      CircleAvatar(child: Text(formatter.format(index + 1))),
                  title: Center(child: Text(navigations[index].name)),
                  subtitle: Center(child: Text(navigations[index].desc)),
                  dense: false,
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => navigations[index].screen,
                      ),
                    );
                    // Navigator.pop(context);
                  },
                ),
              );
            }),
      ),
    );
  }
}
