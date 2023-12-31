import 'package:flutter/material.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

class UserDrawer extends StatefulWidget {
  const UserDrawer({
    Key? key,
    required this.username,
  }) : super(key: key);

  final String username;

  @override
  _UserDrawerState createState() => _UserDrawerState();
}

class _UserDrawerState extends State<UserDrawer> {
  late String _currentUsername;

  @override
  void initState() {
    super.initState();
    _currentUsername = widget.username;
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(_currentUsername),
            accountEmail: Text(''), // Replace with actual email if available
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/4/45/Eopsaltria_australis_-_Mogo_Campground.jpg/640px-Eopsaltria_australis_-_Mogo_Campground.jpg",
              ),
            ),
          ),

          ListTile(
            title: Text('Edit Account'),
            onTap: () {
              _showEditAccountDialog(context);
            },
          ),
          SizedBox(height: 480),
          IconButton(
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
            icon: Icon(Icons.dark_mode),
          )
          // Add more drawer items as needed
        ],
      ),
    );
  }

  void _showEditAccountDialog(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Edit Account'),
          content: Column(
            children: [
              TextField(
                controller: usernameController,
                decoration: InputDecoration(labelText: 'New Username'),
              ),
              TextField(
                controller: passwordController,
                decoration: InputDecoration(labelText: 'New Password'),
                obscureText: true,
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Update the user with the new information
                context.read<AuthProvider>().updateUser(
                      user: User(
                        username: usernameController.text,
                        password: passwordController.text,
                      ),
                    );

                setState(() {
                  _currentUsername = usernameController.text;
                });

                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
