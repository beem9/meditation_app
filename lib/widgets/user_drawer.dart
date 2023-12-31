import 'package:flutter/material.dart';
import 'package:meditation_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatelessWidget {
  const UserDrawer({
    super.key,
    required this.username,
  });

  final String username;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(username),
            accountEmail: Text(''), // Replace with actual email if available
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Eopsaltria_australis_-_Mogo_Campground.jpg/640px-Eopsaltria_australis_-_Mogo_Campground.jpg"),
            ),
          ),
          ListTile(
            title: Text('Item 1'),
            onTap: () {
              // Handle item 1 tap
            },
          ),
          ListTile(
            title: Text('Item 2'),
            onTap: () {
              // Handle item 2 tap
            },
          ),

          SizedBox(
            height: 480,
          ),
          IconButton(
              onPressed: () {
                Provider.of<ThemeProvider>(context, listen: false)
                    .toggleTheme();
              },
              icon: Icon(Icons.dark_mode))
          // Add more drawer items as needed
        ],
      ),
    );
  }
}
