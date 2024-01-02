import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/music.dart';
import 'package:meditation_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  const MusicScreen({Key? key}) : super(key: key);

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Music"),
        actions: [
          IconButton(
            icon: Icon(Icons.favorite),
            onPressed: () {
              _showFavoritesDialog(context);
            },
          ),
        ],
      ),
      body: FutureBuilder(
        future: context.read<MusicProvider>().getMusicList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }

          return Consumer<MusicProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.musicList.length,
              itemBuilder: (context, index) {
                final musicItem = value.musicList[index];

                return InkWell(
                  onTap: () {
                    String combinedParams =
                        '${musicItem.file},${musicItem.title}';
                    GoRouter.of(context)
                        .pushNamed('video', extra: combinedParams);
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(musicItem.title.toString()),
                            IconButton(
                              icon: Icon(
                                musicItem.isFavorite!
                                    ? Icons.favorite
                                    : Icons.favorite_border,
                              ),
                              onPressed: () {
                                // Toggle favorite status
                                context
                                    .read<MusicProvider>()
                                    .toggleFavorite(musicItem);
                              },
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                      ],
                    ),
                  ),
                );
              },
            );
          });
        },
      ),
    );
  }

  void _showFavoritesDialog(BuildContext context) {
    final List<Music> favoritedTracks =
        context.read<MusicProvider>().getFavoritedTracks();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Favorite Tracks'),
          content: Column(
            children: favoritedTracks
                .map((musicItem) => ListTile(
                      title: Text(musicItem.title.toString()),
                    ))
                .toList(),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }
}
