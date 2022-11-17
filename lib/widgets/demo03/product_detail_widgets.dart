import 'package:flutter/material.dart';

class BottomBtnGroup extends StatelessWidget {
  const BottomBtnGroup({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 7.0,
      // color: Colors.yellow,
      child: Container(
        height: 60,
        width: double.infinity,
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Container(
                height: 50.0,
                // width: 50.0,
                color: Colors.white,
                child: const Icon(
                  Icons.shopping_cart,
                  color: Colors.grey,
                ),
              ),
            ),
            Expanded(
              child: Container(
                height: 50.0,
                // width: 50.0,
                color: Colors.white,
                child: const Icon(
                  Icons.account_box,
                  color: Colors.grey,
                ),
              ),
            ),
            Container(
              color: Colors.yellow[700],
              width: MediaQuery.of(context).size.width - 150.0,
              child: const Center(
                child: Text(
                  'Add to Cart',
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 19.0,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
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

class MainImage extends StatelessWidget {
  const MainImage({
    Key? key,
    required this.mainImg,
  }) : super(key: key);

  final String mainImg;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 275.0,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(mainImg),
          fit: BoxFit.fitHeight,
        ),
        color: Colors.white,
      ),
    );
  }
}

AppBar getAppBar(BuildContext context) {
  return AppBar(
    automaticallyImplyLeading: false, // Don't show the leading button
    elevation: 0,
    backgroundColor: Colors.white,
    // leading: ,
    title: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        SizedBox(
          width: 40.0,
          height: 40.0,
          child: Material(
            elevation: 4.0,
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
            child: Container(
              width: 40.0,
              height: 40.0,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(20.0)),
              child: const Icon(
                Icons.favorite,
                color: Colors.red,
              ),
            ),
          ),
        )
      ],
    ),

    actions: const [],
  );
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;

  const SelectedPhoto({
    super.key,
    required this.numberOfDots,
    required this.photoIndex,
  });

  Widget _inactivePhoto() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        width: 8.0,
        height: 8.0,
        decoration: BoxDecoration(
            color: Colors.grey, borderRadius: BorderRadius.circular(4.0)),
      ),
    );
  }

  Widget _activePhoto() {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0),
      child: Container(
        width: 10.0,
        height: 10.0,
        decoration: BoxDecoration(
          color: Colors.yellow,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 0.0,
              blurRadius: 2.0,
            )
          ],
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _buildDots(),
      ),
    );
  }
}

class ProductID extends StatelessWidget {
  const ProductID({
    Key? key,
    required this.id,
  }) : super(key: key);

  final String id;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        'Alcide Number: $id',
        style: const TextStyle(
          color: Colors.grey,
          fontFamily: 'Quicksand',
          fontSize: 15.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProductName extends StatelessWidget {
  const ProductName({
    Key? key,
    required this.name,
  }) : super(key: key);
  final String name;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: Text(
        name,
        style: const TextStyle(
          color: Colors.black,
          fontFamily: 'Quicksand',
          fontSize: 28.0,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class ProductDescAndPrice extends StatelessWidget {
  const ProductDescAndPrice({
    Key? key,
    required this.description,
    required this.price,
  }) : super(key: key);

  final String description;
  final String price;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2 + 70.0,
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              color: Colors.grey.withOpacity(0.8),
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: Text(
            price,
            style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black,
                fontFamily: 'Montserrat',
                fontSize: 24.0),
          ),
        )
      ],
    );
  }
}

Widget colorItems(Color color) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Container(
      width: 40.0,
      height: 40.0,
      decoration: BoxDecoration(shape: BoxShape.circle, color: color),
    ),
  );
}

Widget materialItems(IconData icon, String percentage) {
  return Padding(
    padding: const EdgeInsets.only(left: 15.0, right: 15.0),
    child: Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.grey,
          size: 30.0,
        ),
        const Padding(
          padding: EdgeInsets.only(right: 8.0),
        ),
        Text(
          percentage,
          style: const TextStyle(
            fontFamily: 'Montserrat',
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 16.0,
          ),
        )
      ],
    ),
  );
}

class MaterialTitle extends StatelessWidget {
  const MaterialTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        'MATERIAL',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.black,
          fontFamily: 'Montserrat',
          fontSize: 20.0,
        ),
      ),
    );
  }
}

class ColourTitle extends StatelessWidget {
  const ColourTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: 15.0),
      child: Text(
        'COLOUR',
        style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontFamily: 'Montserrat',
            fontSize: 20.0),
      ),
    );
  }
}
