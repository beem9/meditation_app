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
  void initState() {
    ExerciseProvider().finishExercise(1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Yoga Videos"),
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

          return Consumer<ExerciseProvider>(builder: (context, value, child) {
            return ListView.builder(
              itemCount: exerciseList.length,
              itemBuilder: (context, index) {
                bool visibilityController = exerciseList[index].finished!;

                return Visibility(
                  visible: visibilityController,
                  child: InkWell(
                    onTap: () {
                      String combinedParams =
                          '${value.exerciseList[index].file},${value.exerciseList[index].title}';
                      GoRouter.of(context)
                          .pushNamed('video', extra: combinedParams);
                    },
                    child: Card(
                      elevation: 3,
                      margin: EdgeInsets.all(10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ListTile(
                        contentPadding: EdgeInsets.all(15),
                        title: Text(
                          exerciseList[index].title.toString(),
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        trailing: Checkbox(
                          value: exerciseList[index].finished!,
                          onChanged: (newValue) {
                            ExerciseProvider().finishExercise(
                              exerciseList[index + 1].id!,
                            );
                            setState(() {});
                          },
                          activeColor: Colors.green,
                        ),
                      ),
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
