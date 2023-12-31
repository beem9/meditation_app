import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/exercise_provider.dart';
import 'package:meditation_app/providers/music_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class MusicScreen extends StatefulWidget {
  MusicScreen({super.key});

  @override
  State<MusicScreen> createState() => _MusicScreenState();
}

class _MusicScreenState extends State<MusicScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Music"),
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AddTipDialog();
                },
              );
            },
            icon: Icon(Icons.add),
          )
        ],
      ),
      body: FutureBuilder(
        future: context.read<MusicProvider>().getMusicList(),
        builder: (context, snapshot) {
          return Consumer<MusicProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.musicList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context
                          .read<MusicProvider>()
                          .musicList[index]
                          .title
                          .toString()),
                      Column(children: [
                        Text(context
                            .read<MusicProvider>()
                            .musicList[index]
                            .file
                            .toString())
                      ]),
                      Text("data")
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
