import 'package:flutter/material.dart';

class imageNews extends StatelessWidget {
  const imageNews({super.key, this.height = 200, required this.image});
  final String image;
  final double height;

  @override
  Widget build(BuildContext context) {
    bool isValidUrl = Uri.tryParse(image)?.hasAbsolutePath ?? false;

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: (!isValidUrl || image.isEmpty)
          ? Container(
              height: height,
              width: double.infinity,
              color: Colors.grey[300],
              child: const Icon(
                Icons.image_not_supported,
                size: 50,
                color: Colors.grey,
              ),
            )
          : Image.network(
              image,
              height: height,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: height,
                  width: double.infinity,
                  color: Colors.grey[300],
                  child: const Icon(
                    Icons.broken_image,
                    size: 50,
                    color: Colors.grey,
                  ),
                );
              },
            ),
    );
  }
}
