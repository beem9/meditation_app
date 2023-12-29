import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  final String image;
  final String title;
  final VoidCallback onTap;

  GridItem({required this.image, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.network(image,
                height: 80,
                width:
                    80), // You can replace this with your own way of loading images
            SizedBox(height: 8),
            Text(title),
          ],
        ),
      ),
    );
  }
}
