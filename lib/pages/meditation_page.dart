import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/meditation_provider.dart';

import 'package:meditation_app/providers/music_provider.dart';
import 'package:provider/provider.dart';

class MeditationScreen extends StatefulWidget {
  const MeditationScreen({Key? key}) : super(key: key);

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Meditation"),
      ),
      body: FutureBuilder(
        future: context.read<MeditationProvider>().getMeditationList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return const Center(child: Text('Error loading data'));
          }

          return Consumer<MeditationProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: value.meditataionList.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    String combinedParams =
                        'https://coded-meditation.eapi.joincoded.com/media/meditation/driving.mp3,${value.meditataionList[index].title}';
                    GoRouter.of(context)
                        .pushNamed('video', extra: combinedParams);
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(value.meditataionList[index].title.toString()),
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
