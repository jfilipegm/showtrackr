import 'package:flutter/material.dart';
import '../assets/components/mainButton.dart';
import 'constants/sizes.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // TO DO #4
    // Handle tracked shows count
    final int trackedShows = 5;
    const double appTitleSizedBox = Sizes.xxs + Sizes.xs;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Show Trackr',
              style: TextStyle(
                color: Colors.white,
                fontSize: Sizes.l,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: appTitleSizedBox),
            Text(
              trackedShows == 0
                  ? 'No shows are being tracked'
                  : "You're currently tracking $trackedShows show${trackedShows == 1 ? '' : 's'}",
              style: const TextStyle(color: Colors.white70, fontSize: Sizes.s),
            ),
            const SizedBox(height: Sizes.m),

            if (trackedShows == 0)
              Mainbutton(
                onPressed: () {
                  // TO DO #1
                  // Handle "Track Shows"
                },
                label: 'Track Shows',
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mainbutton(
                    onPressed: () {
                      // TO DO #3
                      // Handle "Track more Shows"
                    },
                    label: 'Track more Shows',
                  ),
                  const SizedBox(width: Sizes.s),
                  Mainbutton(
                    onPressed: () {
                      // TO DO #2
                      // Handle "Check tracked shows"
                    },
                    label: 'Check tracked shows',
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
