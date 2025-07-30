import 'package:flutter/material.dart';
import '../assets/components/title_text.dart';
import 'constants/sizes.dart';

class TrackShowsScreen extends StatefulWidget {
  const TrackShowsScreen({super.key});

  @override
  State<TrackShowsScreen> createState() => _TrackShowsScreenState();
}

class _TrackShowsScreenState extends State<TrackShowsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.chevron_left,
            color: Colors.white,
            size: Sizes.l,
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        backgroundColor: Colors.transparent,
        title: const TitleText('Add Series'),
        titleSpacing: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.m),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SearchBar(
              leading: const Icon(Icons.search),
              hintText: 'Search for a show...',
              backgroundColor: WidgetStateProperty.all(Colors.white70),
              shadowColor: WidgetStateProperty.all(Colors.white),
              elevation: WidgetStatePropertyAll(1.5),
            ),
            // TO DO (search bar suggestions)
            //SearchAnchor.bar(suggestionsBuilder: suggestionsBuilder)
          ],
        ),
      ),
    );
  }
}
