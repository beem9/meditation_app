import 'package:flutter/material.dart';

import 'package:meditation_app/providers/meditation_provider.dart';

import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class MeditationScreen extends StatefulWidget {
  MeditationScreen({super.key});

  @override
  State<MeditationScreen> createState() => _MeditationScreenState();
}

class _MeditationScreenState extends State<MeditationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Meditation"),
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
        future: context.read<MeditationProvider>().getMeditationList(),
        builder: (context, snapshot) {
          return Consumer<MeditationProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.meditataionList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(context
                          .read<MeditationProvider>()
                          .meditataionList[index]
                          .title
                          .toString()),
                      Column(children: [
                        Text(context
                            .read<MeditationProvider>()
                            .meditataionList[index]
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
