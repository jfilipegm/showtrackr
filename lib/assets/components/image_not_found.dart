import 'package:flutter/material.dart';

class ImageNotFound extends StatelessWidget {
  const ImageNotFound({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 120,
      color: Colors.grey,
      child: const Icon(Icons.image_not_supported, color: Colors.white),
    );
  }
}
