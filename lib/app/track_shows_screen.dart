import 'dart:convert'; // for json.decode
import 'package:http/http.dart' as http; // for http.get
import 'package:flutter/material.dart';
import '../assets/components/title_text.dart';
import '../assets/components/image_not_found.dart';
import '../assets/components/show_poster.dart';
import '../assets/components/main_button.dart';
import 'constants/sizes.dart';

class TrackShowsScreen extends StatefulWidget {
  const TrackShowsScreen({super.key});

  @override
  State<TrackShowsScreen> createState() => _TrackShowsScreenState();
}

class _TrackShowsScreenState extends State<TrackShowsScreen> {
  List<dynamic> _shows = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    fetchShows();
  }

  // TO DO: Maybe remove this and create file just for requests
  Future<void> fetchShows() async {
    try {
      final response = await http.get(
        Uri.parse('https://api.tvmaze.com/shows'),
      );
      if (response.statusCode == 200) {
        final List data = json.decode(response.body);
        setState(() {
          _shows = data.take(20).toList();
          _isLoading = false;
        });
      } else {
        throw Exception('Failed to load shows');
      }
    } catch (e) {
      print('Error fetching shows: $e');
      setState(() => _isLoading = false);
    }
  }

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
              elevation: const WidgetStatePropertyAll(1.5),
            ),
            const SizedBox(height: Sizes.s),
            _isLoading
                ? const Expanded(
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : Expanded(
                    child: ListView.builder(
                      itemCount: _shows.length,
                      itemBuilder: (context, index) {
                        final show = _shows[index];
                        final showName = show['name'] ?? 'No Name';
                        final networkName = show['network']?['name'];
                        final ratingAverage = show['rating']?['average'];
                        final imageUrl = show['image']?['medium'];

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: Sizes.xs,
                          ),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              imageUrl != null
                                  ? ShowPoster(imageUrl: imageUrl)
                                  : const ImageNotFound(),
                              const SizedBox(width: Sizes.s),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      showName,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: Sizes.m,
                                      ),
                                    ),
                                    const SizedBox(height: Sizes.xxs),
                                    Text(
                                      '${networkName ?? 'Unknown Network'} - ${ratingAverage?.toString() ?? 'N/A'}',
                                      style: const TextStyle(
                                        color: Colors.white70,
                                        fontSize: Sizes.s,
                                      ),
                                    ),
                                    const SizedBox(height: Sizes.xs),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Mainbutton(
                                        onPressed: () {
                                          // TODO: Handle "Track shows"
                                        },
                                        label: '+ Track',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
