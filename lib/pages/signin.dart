import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/models/user.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class SignInScreen extends StatelessWidget {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login Page'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: usernameController,
              decoration: InputDecoration(labelText: 'Username'),
            ),
            SizedBox(height: 16.0),
            TextField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(labelText: 'Password'),
            ),
            SizedBox(height: 16.0),
            TextButton(
              onPressed: () {
                GoRouter.of(context).push("/signup");
                // Handle sign up logic
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                // Handle sign in logic using usernameController.text and passwordController.text
                context
                    .read<AuthProvider>()
                    .signin(
                        user: User(
                            username: usernameController.text,
                            password: passwordController.text))
                    .then((token) {
                  if (token.isNotEmpty) {
                    GoRouter.of(context).go("/home");
                  }
                });
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
