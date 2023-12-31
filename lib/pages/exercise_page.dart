import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/exercises.dart';
import 'package:meditation_app/providers/exercise_provider.dart';
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
      ),
      body: FutureBuilder(
        future: context.read<ExerciseProvider>().getExerciseList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text('Error loading data'));
          }

          final exerciseList = snapshot.data
              as List<Exercises>; // Assuming Exercise is your data model

          return ListView.builder(
            itemCount: exerciseList.length,
            itemBuilder: (context, index) {
              bool visibilityController = exerciseList[index].finished!;

              return Visibility(
                visible: visibilityController,
                child: InkWell(
                  onTap: () {
                    GoRouter.of(context).pushNamed('video',
                        extra:
                            'https://coded-meditation.eapi.joincoded.com/media/yoga/tree_pose.mp4');
                  },
                  child: Card(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(exerciseList[index].title.toString()),
                        SizedBox(height: 15),
                        IconButton(
                            onPressed: () {
                              ExerciseProvider()
                                  .finishExercise(exerciseList[index + 1].id!);
                              setState(() {});
                            },
                            icon: Icon(Icons.check))
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
