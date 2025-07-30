import 'package:flutter/material.dart';
import '../../app/constants/sizes.dart';

class TitleText extends StatelessWidget {
  final String text;

  const TitleText(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontSize: Sizes.l,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
