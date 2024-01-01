import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
                return InkWell(
                  onTap: () {
                    String combinedParams =
                        'https://coded-meditation.eapi.joincoded.com/media/meditation/driving.mp3,${value.musicList[index].title}';
                    GoRouter.of(context)
                        .pushNamed('video', extra: combinedParams);
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.musicList[index].title.toString()),
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
}
