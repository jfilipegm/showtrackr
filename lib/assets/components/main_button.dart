import 'package:flutter/material.dart';

class Mainbutton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const Mainbutton({super.key, required this.onPressed, required this.label});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(backgroundColor: Colors.blue),
      onPressed: onPressed,
      child: Text(label, style: const TextStyle(color: Colors.white)),
    );
  }
}
