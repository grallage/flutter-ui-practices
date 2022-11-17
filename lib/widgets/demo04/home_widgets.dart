import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/screens/demo04/pet_detail_screens.dart';

List<Widget> getTopWrapper() {
  return [
    const Padding(
      padding: EdgeInsets.only(top: 28.0, left: 40.0),
      child: CircleAvatar(
        backgroundImage: AssetImage('assets/demo04/profile.jpg'),
        radius: 25.0,
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 48.0, left: 100.0, right: 100.0),
      child: Text(
        'Location',
        style: TextStyle(color: Colors.grey[350], fontSize: 18.0),
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 18.0, left: 38.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: const <Widget>[
          Icon(
            Icons.add_location,
            color: Colors.black,
            size: 40.0,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0),
            child: Text(
              'Luisville,',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontSize: 30.0,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Text(
              'KY',
              style: TextStyle(color: Colors.black, fontSize: 30.0),
            ),
          )
        ],
      ),
    ),
    Padding(
      padding: const EdgeInsets.only(top: 25.0, left: 40.0, right: 40.0),
      child: Divider(
        height: 2.0,
        color: Colors.grey[300],
      ),
    ),
  ];
}

class PetTabItem extends StatefulWidget {
  const PetTabItem(
      {super.key,
      required this.selectedIndex,
      required this.index,
      required this.onTap,
      required this.items});

  final int selectedIndex;
  final int index;
  final List<String> items;
  final void Function() onTap;

  @override
  State<PetTabItem> createState() => _PetTabItemState();
}

class _PetTabItemState extends State<PetTabItem> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 22.0,
        right: 14.0,
      ),
      child: Material(
        child: GestureDetector(
          onTap: widget.onTap,
          // onTap: () {
          //   setState(
          //     () {
          //       _selectedIndex = index;
          //       print('Selected index :$_selectedIndex');
          //     },
          //   );
          // },
          child: Container(
            height: widget.index == widget.selectedIndex ? 140.0 : 150.0,
            width: widget.index == widget.selectedIndex ? 75.0 : 65.0,
            decoration: BoxDecoration(
              border: widget.index == widget.selectedIndex
                  ? Border.all(color: Colors.red[100]!, width: 5)
                  : null,
              borderRadius: BorderRadius.circular(15.0),
              color: widget.index == widget.selectedIndex
                  ? Colors.red
                  : Colors.grey[300],
            ),
            child: Center(
              child: Text(
                widget.items[widget.index],
                style: TextStyle(
                  color: widget.index == widget.selectedIndex
                      ? Colors.white
                      : Colors.black,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget getSubSectionPage(int currentIndex) {
  List<String> listImages = [
    'assets/demo04/image_three.jpg',
    'assets/demo04/image_one.jpg',
    'assets/demo04/image_two.jpg',
    'assets/demo04/image_one.jpg',
    'assets/demo04/image_one.jpg'
  ];

  if (currentIndex == 0) {
    return const SizedBox(
      height: 20.0,
      width: 20.0,
      child: Center(
        child: Text(
          'Cats page',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  } else if (currentIndex == 1) {
    return ListView.builder(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: listImages.length,
      itemBuilder: (BuildContext context, int index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Demo04PetDetailScreen(
                      image: listImages[index],
                    ),
                  ),
                );
              },
              child: Container(
                width: 500.0,
                height: 200.0,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    bottomLeft: Radius.circular(20.0),
                  ),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage(
                      listImages[index],
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const <Widget>[
                  Padding(
                    padding: EdgeInsets.only(top: 12.0),
                    child: Text(
                      'Puppy Katherin',
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 12.0, right: 20.0),
                    child: Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                      size: 25.0,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0, left: 5.0, bottom: 50.0),
              child: Text(
                'French Black puppy',
                style: TextStyle(color: Colors.grey[400], fontSize: 15.0),
              ),
            )
          ],
        );
      },
    );
  } else if (currentIndex == 2) {
    return const SizedBox(
      height: 20.0,
      width: 20.0,
      child: Center(
        child: Text(
          'Birds page',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  } else {
    return const SizedBox(
      height: 20.0,
      width: 20.0,
      child: Center(
        child: Text(
          'Others page',
          style: TextStyle(color: Colors.black, fontSize: 20.0),
        ),
      ),
    );
  }
}
