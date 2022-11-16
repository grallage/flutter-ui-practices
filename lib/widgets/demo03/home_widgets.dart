import 'package:flutter/material.dart';

List<Widget> getTopBackground() {
  return [
    Container(
      height: 250,
      width: double.infinity,
      color: Colors.orange[300],
    ),
    Positioned(
      bottom: 50.0,
      right: 100.0,
      child: Container(
        height: 400.0,
        width: 400.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Colors.yellow[100]!.withOpacity(0.2),
          backgroundBlendMode: BlendMode.plus,
        ),
      ),
    ),
    Positioned(
      bottom: 100.0,
      left: 150.0,
      child: Container(
        height: 300.0,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(200.0),
          color: Colors.yellow[100]!.withOpacity(0.2),
          backgroundBlendMode: BlendMode.plus,
        ),
      ),
    ),
  ];
}

class Avatar extends StatelessWidget {
  const Avatar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      width: 50.0,
      height: 50.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.white,
          style: BorderStyle.solid,
          width: 2.0,
        ),
        shape: BoxShape.circle,
        image: const DecorationImage(
          image: AssetImage('assets/demo03/chris.jpg'),
        ),
      ),
    );
  }
}

List<Widget> getTopInfo() {
  return [
    const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        'Hello , Pino',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            fontSize: 30.0),
      ),
    ),
    const SizedBox(
      height: 15.0,
    ),
    const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        'What do you want to buy?',
        style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontFamily: 'Quicksand',
            fontSize: 23.0),
      ),
    ),
  ];
}

class SearchBox extends StatelessWidget {
  const SearchBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(5.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.yellow[700],
            size: 30.0,
          ),
          contentPadding: const EdgeInsets.only(
            left: 15.0,
            top: 15.0,
          ),
          hintText: 'Search',
          hintStyle: const TextStyle(
            color: Colors.grey,
            fontFamily: 'Quicksand',
          ),
        ),
      ),
    );
  }
}
