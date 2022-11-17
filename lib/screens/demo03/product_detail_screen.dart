import 'package:flutter/material.dart';

import '../../widgets/demo03/product_detail_widgets.dart';

class Demo03ProductDetailScreen extends StatefulWidget {
  const Demo03ProductDetailScreen({super.key});

  @override
  State<Demo03ProductDetailScreen> createState() =>
      _Demo03ProductDetailScreenState();
}

class _Demo03ProductDetailScreenState extends State<Demo03ProductDetailScreen> {
  int photoIndex = 0;
  List<String> photos = [
    'assets/demo03/ottoman.jpg',
    'assets/demo03/otto2.jpeg',
    'assets/demo03/otto3.jpg',
    'assets/demo03/otto4.jpg'
  ];
  void _previousImage() {
    setState(() {
      photoIndex = photoIndex > 0 ? photoIndex - 1 : 0;
    });
  }

  void _nextImage() {
    setState(() {
      photoIndex = photoIndex < photos.length - 1 ? photoIndex + 1 : photoIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    final mainImg = photos[photoIndex];
    return Scaffold(
      appBar: getAppBar(context),
      body: SingleChildScrollView(
        // ListView
        // shrinkWrap: true,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _getTopWrapper(mainImg, context),
            const SizedBox(
              height: 30.0,
            ),
            const ProductID(id: '2323X'),
            const SizedBox(
              height: 14.0,
            ),
            const ProductName(name: 'Finn Navian-Sofa'),
            const SizedBox(
              height: 14.0,
            ),
            const Padding(
              padding: EdgeInsets.only(left: 15.0),
              child: ProductDescAndPrice(
                description:
                    'Scandinavian small size sofa / imported full leather/Dail italia oil wax leather black',
                price: '\$248',
              ),
            ),
            const SizedBox(
              height: 20.0,
            ),
            const ColourTitle(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                colorItems(Colors.black),
                colorItems(Colors.grey),
                colorItems(Colors.grey[300]!),
              ],
            ),
            const SizedBox(
              height: 20.0,
            ),
            const MaterialTitle(),
            const SizedBox(
              height: 20.0,
            ),
            Row(
              children: <Widget>[
                materialItems(Icons.work, 'x30%'),
                materialItems(Icons.book, 'x60%'),
                materialItems(Icons.timeline, 'x10%'),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomBtnGroup(),
    );
  }

  Stack _getTopWrapper(String mainImg, BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        MainImage(mainImg: mainImg),
        Positioned(
          right: 0,
          child: GestureDetector(
            onTap: _nextImage,
            child: Container(
              height: 275.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          left: 0,
          child: GestureDetector(
            onTap: _previousImage,
            child: Container(
              height: 275.0,
              width: MediaQuery.of(context).size.width / 2,
              color: Colors.transparent,
            ),
          ),
        ),
        Positioned(
          top: 255.0,
          // left: MediaQuery.of(context).size.width / 2 - 50.0,
          child: SelectedPhoto(
            numberOfDots: photos.length,
            photoIndex: photoIndex,
          ),
        )
      ],
    );
  }
}
