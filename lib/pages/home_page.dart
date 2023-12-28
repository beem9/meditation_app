import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Meditation"), actions: [
        TextButton(
            onPressed: () {
              GoRouter.of(context).go("/signin");
            },
            child: Text("Log Out"))
      ]),
    );
  }
}
