import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/providers/exercise_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:meditation_app/widgets/dialog_tip.dart';
import 'package:provider/provider.dart';

class ExerciseScreen extends StatefulWidget {
  ExerciseScreen({super.key});

  @override
  State<ExerciseScreen> createState() => _ExerciseScreenState();
}

class _ExerciseScreenState extends State<ExerciseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Exercises"),
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
        future: context.read<ExerciseProvider>().getExerciseList(),
        builder: (context, snapshot) {
          return Consumer<ExerciseProvider>(
            builder: (context, value, child) => ListView.builder(
              itemCount: value.exerciseList.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(context
                            .read<ExerciseProvider>()
                            .exerciseList[index]
                            .title),
                        Text("data"),
                        Text("data")
                      ],
                    ),
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
