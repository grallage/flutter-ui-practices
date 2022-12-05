import 'package:flutter/material.dart';

class Demo05GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String itemPath;
  final MaterialColor color;
  final void Function()? onPressed;

  const Demo05GroceryItemTile(
      {super.key,
      required this.itemName,
      required this.itemPrice,
      required this.itemPath,
      required this.color,
      this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: color[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(
              itemPath,
              height: 64,
            ),
            Text(itemName),
            MaterialButton(
              onPressed: onPressed,
              color: color[800],
              child: Text(
                '\$$itemPrice',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
