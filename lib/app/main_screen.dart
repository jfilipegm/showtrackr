import 'package:flutter/material.dart';
import '../assets/components/main_button.dart';
import 'constants/sizes.dart';
import 'track_shows_screen.dart';
import '../assets/components/title_text.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    // TO DO: Handle tracked shows count
    final int trackedShows = 0;
    const double appTitleSizedBox = Sizes.xxs + Sizes.xs;

    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const TitleText('Show Trackr'),
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TrackShowsScreen(),
                    ),
                  );
                },
                label: 'Track Shows',
              )
            else
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Mainbutton(
                    onPressed: () {
                      // TO DO: Handle "Track more Shows"
                    },
                    label: 'Track more Shows',
                  ),
                  const SizedBox(width: Sizes.s),
                  Mainbutton(
                    onPressed: () {
                      // TO DO: Handle "Check tracked shows"
                      //fuck db's will use a json fuck it
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
