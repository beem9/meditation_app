import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/widgets/grid.dart';
import 'package:meditation_app/widgets/user_drawer.dart';
import 'package:provider/provider.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User user = User(username: '', password: '');

  // Check if the user is connected to the internet
  Future<bool> _isConnected() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult != ConnectivityResult.none;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              bool isConnected = await _isConnected();
              if (isConnected) {
                context.read<AuthProvider>().logOut();
                GoRouter.of(context).goNamed("signin");
              } else {
                // Display a message when not connected to the internet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please connect to the internet."),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
            icon: Icon(Icons.logout),
          )
        ],
        title: Text('Profile Page'),
      ),
      drawer: UserDrawer(
        username: context.read<AuthProvider>().getUserFromToken().username,
      ),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
        ),
        children: [
          GridItem(
            image: "assets/images/tips.png",
            title: "Tips",
            onTap: () async {
              bool isConnected = await _isConnected();
              if (isConnected) {
                GoRouter.of(context).pushNamed("tips");
              } else {
                // Display a message when not connected to the internet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please connect to the internet."),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          GridItem(
            image: "assets/images/videos.png",
            title: "Yoga videos",
            onTap: () async {
              bool isConnected = await _isConnected();
              if (isConnected) {
                GoRouter.of(context).pushNamed("exer");
              } else {
                // Display a message when not connected to the internet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please connect to the internet."),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          GridItem(
            image: "assets/images/music.png",
            title: "Music",
            onTap: () async {
              bool isConnected = await _isConnected();
              if (isConnected) {
                GoRouter.of(context).pushNamed("music");
              } else {
                // Display a message when not connected to the internet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please connect to the internet."),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          ),
          GridItem(
            image: "assets/images/med.png",
            title: "Meditation",
            onTap: () async {
              bool isConnected = await _isConnected();
              if (isConnected) {
                GoRouter.of(context).pushNamed("med");
              } else {
                // Display a message when not connected to the internet
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("Please connect to the internet."),
                    duration: Duration(seconds: 2),
                  ),
                );
              }
            },
          )
        ],
      ),
    );
  }
}
