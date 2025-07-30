import 'package:flutter/material.dart';
import 'package:showtrackr/app/main_screen.dart';

void main() {
  runApp(ShowTrackr());
}

class ShowTrackr extends StatefulWidget {
  const ShowTrackr({super.key});

  @override
  State<ShowTrackr> createState() => _ShowTrackrState();
}

class _ShowTrackrState extends State<ShowTrackr> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: MainScreen());
  }
}
