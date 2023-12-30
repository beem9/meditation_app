import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/widgets/grid.dart';
import 'package:meditation_app/widgets/user_drawer.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  User user = User(username: '', password: '');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      drawer: UserDrawer(
          username: context.read<AuthProvider>().getUserFromToken().username),
      body: GridView(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, mainAxisSpacing: 10),
        children: [
          GridItem(
              image: "assets/images/tips.png",
              title: "Tips",
              onTap: () {
                GoRouter.of(context).pushNamed('tips');
              }),
          GridItem(
              image: "assets/images/videos.png",
              title: "Yoga videos",
              onTap: () {
                GoRouter.of(context).pushNamed('ptips');
              }),
          GridItem(
              image: "assets/images/music.png", title: "Music", onTap: () {}),
          GridItem(
              image: "assets/images/med.png", title: "Meditation", onTap: () {})
        ],
      ),
    );
  }
}

// void _showUserProfile(BuildContext context, User user) {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       return AlertDialog(
//         title: Text('User Details'),
//         content: Column(
//           mainAxisSize: MainAxisSize.min,
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: <Widget>[
//             Center(
//               child: CircleAvatar(
//                 radius: 50,
//                 //backgroundImage: user.picture as ImageProvider,
//               ),
//             ),
//             SizedBox(height: 10),
//             Text(
//                 'Username: ${context.read<AuthProvider>().getUsernameFromToken()}'),
//           ],
//         ),
//         actions: <Widget>[
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop();
//             },
//             child: Text('Close'),
//           ),
//         ],
//       );
//     },
//   );
// }