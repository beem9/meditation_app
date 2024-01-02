import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/meditation_provider.dart';
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

          return Consumer<MeditationProvider>(
            builder: (context, value, child) {
              return ListView.builder(
                itemCount: value.meditationList.length,
                itemBuilder: (context, index) {
                  final meditationItem = value.meditationList[index];

                  return Card(
                    child: ListTile(
                      title: Text(
                        meditationItem.title.toString(),
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.play_arrow),
                        onPressed: () {
                          String combinedParams =
                              '${meditationItem.file},${meditationItem.title}';
                          GoRouter.of(context)
                              .pushNamed('video', extra: combinedParams);
                        },
                      ),
                      onTap: () {
                        String combinedParams =
                            '${meditationItem.file},${meditationItem.title}';
                        GoRouter.of(context)
                            .pushNamed('video', extra: combinedParams);
                      },
                    ),
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
