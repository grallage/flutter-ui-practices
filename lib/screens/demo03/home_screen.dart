import 'package:flutter/material.dart';
import 'package:flutter_ui_practices/widgets/demo03/home_widgets.dart';

class Demo03HomeScreen extends StatefulWidget {
  const Demo03HomeScreen({super.key});

  @override
  State<Demo03HomeScreen> createState() => _Demo03HomeScreenState();
}

class _Demo03HomeScreenState extends State<Demo03HomeScreen> {
  final bottomTextStyle = const TextStyle(
    color: Colors.white,
    fontFamily: 'Quicksand',
    fontWeight: FontWeight.bold,
  );

  Widget itemCard(String title, String imgPath, bool isFavourite) {
    var productImage = Container(
      width: 140.0,
      height: 150.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(imgPath),
          fit: BoxFit.cover,
        ),
      ),
    );
    var likeBtn = Material(
      elevation: isFavourite ? 2.0 : 0.0,
      borderRadius: BorderRadius.circular(20.0),
      child: Container(
        width: 40.0,
        height: 40.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: isFavourite ? Colors.white : Colors.grey.withOpacity(0.2),
        ),
        child: Center(
          child: isFavourite
              ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
              : const Icon(Icons.favorite_border),
        ),
      ),
    );
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: GestureDetector(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) {
          //   return ProductDetailScreen();
          // }));
        },
        child: Container(
          color: Colors.white,
          // height: 155.0,
          width: double.infinity,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              // product image
              productImage,
              const SizedBox(
                width: 4.0,
              ),
              // right side
              Container(
                constraints: const BoxConstraints(maxWidth: 300),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            title,
                            style: const TextStyle(
                                fontFamily: 'Quicksand',
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold),
                          ),
                          likeBtn,
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    Container(
                      // width: 175.0,
                      child: const Text(
                        'Scandinavian small sized double sofa imported full leather / Dale Italia oil wax leather black',
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 5.0,
                    ),
                    // bottom container
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const SizedBox(
                          width: 35.0,
                        ),
                        Container(
                          height: 40.0,
                          width: 50.0,
                          color: Colors.orange,
                          child: Center(
                            child: Text(
                              "\$248",
                              style: bottomTextStyle,
                            ),
                          ),
                        ),
                        Container(
                          height: 40.0,
                          width: 100.0,
                          color: Colors.yellow[700],
                          child: Center(
                            child: Text(
                              "Add to cart",
                              style: bottomTextStyle,
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return
        // Scaffold(
        //   body:
        SafeArea(
      child: ListView(
        children: [
          const TopWrapper(),
          const SizedBox(
            height: 15.0,
          ),
          const FilterWrapper(),
          itemCard('FinnNavian', 'assets/demo03/ottoman.jpg', true),
          itemCard('FinnNavian', 'assets/demo03/anotherchair.jpg', false),
          itemCard('FinnNavian', 'assets/demo03/chair.jpg', false)
        ],
      ),
    );
    // );
  }
}

class FilterWrapper extends StatelessWidget {
  const FilterWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1,
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        height: 75,
        child: ListView(
          shrinkWrap: true,
          // physics:
          //     const ClampingScrollPhysics(), // AlwaysScrollableScrollPhysics
          scrollDirection: Axis.horizontal,
          children: const <Widget>[
            FilterItem(imgage: 'assets/demo03/sofas.png', text: 'Sofas'),
            FilterItem(imgage: 'assets/demo03/wardrobe.png', text: 'Wardrobe'),
            FilterItem(imgage: 'assets/demo03/desk.png', text: 'Desk'),
            FilterItem(imgage: 'assets/demo03/dresser.png', text: 'Dresser'),
            FilterItem(imgage: 'assets/demo03/sofas.png', text: 'Sofas'),
          ],
        ),
      ),
    );
  }
}

class FilterItem extends StatelessWidget {
  const FilterItem({
    Key? key,
    this.height = 75,
    required this.imgage,
    this.text = '',
    this.width = -1,
  }) : super(key: key);
  final double height;
  final String imgage;
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width < 0 ? MediaQuery.of(context).size.width / 4 : width,
      child: Column(
        children: <Widget>[
          Container(
            height: 50.0,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(imgage),
              ),
            ),
          ),
          Text(text, style: const TextStyle(fontFamily: 'Quicksand'))
        ],
      ),
    );
  }
}

class TopWrapper extends StatelessWidget {
  const TopWrapper({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Stack Size
        ...getTopBackground(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // show avatar and more btn
              Row(
                children: [
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15),
                    child: Avatar(),
                  ),
                  Expanded(child: Container()),
                  Container(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: const Icon(Icons.menu),
                      color: Colors.white,
                      onPressed: () => {},
                      iconSize: 30.0,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 50.0,
              ),
              ...getTopInfo(),
              const SizedBox(
                height: 25.0,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: SearchBox(),
              ),
              const SizedBox(
                height: 15.0,
              )
            ],
          ),
        ),
      ],
    );
  }
}
