// squaretile.dart
import 'package:flutter/material.dart';

class SquareTile extends StatelessWidget {
  final String imagePath;

  const SquareTile({required this.imagePath});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(12.0),
        color: Colors.grey[200],
      ),
      child: Image.asset(
        imagePath,
        width: 50,
        height: 50,
      ),
    );
  }
}
