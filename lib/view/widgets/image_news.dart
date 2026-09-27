import 'package:flutter/material.dart';

class imageNews extends StatelessWidget {
  const imageNews({super.key, this.height = 200, required this.image});
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        image,
        height: height,
        width: double.infinity,
        fit: .cover,
      ),
    );
  }
}
