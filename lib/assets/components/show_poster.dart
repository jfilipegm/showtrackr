import 'package:flutter/material.dart';
import './image_not_found.dart';
import '../../app/constants/sizes.dart';

class ShowPoster extends StatelessWidget {
  final String imageUrl;

  const ShowPoster({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(Sizes.s),
      child: Image.network(
        imageUrl,
        width: 80,
        height: 120,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const ImageNotFound();
        },
      ),
    );
  }
}
