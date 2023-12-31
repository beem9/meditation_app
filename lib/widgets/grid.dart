import 'dart:ui';

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
        elevation: 5, // Add elevation for a subtle shadow effect
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
              15.0), // Increase the radius for more rounded corners
        ),
        child: Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(15.0), // Same as Card's borderRadius
            image: DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage(image),
            ),
          ),
          child: ClipRRect(
            borderRadius:
                BorderRadius.circular(15.0), // Adjust the radius as needed
            child: BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: 2.0,
                sigmaY: 2.0,
              ),
              child: Container(
                padding: EdgeInsets.all(
                    16.0), // Add padding for better content spacing
                color: Colors.white.withOpacity(
                    0.7), // Adjust the opacity for the desired blur effect
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 18.0, // Adjust the font size as needed
                      ),
                      textAlign: TextAlign.center, // Center the text
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
