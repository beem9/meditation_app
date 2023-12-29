import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/pages/signin.dart';
import 'package:meditation_app/pages/signup.dart';
import 'package:meditation_app/pages/tips_page.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/tips_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (context) => AuthProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => TipProvider(),
    ),
  ], child: MyApp()));
}

// ChangeNotifierProvider(
//   create: (context) => TodoProvider(),

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }

  final _router = GoRouter(routes: [
    GoRoute(
      path: "/home",
      name: "home",
      builder: (context, state) => MyHomePage(),
    ),
    GoRoute(
      path: "/tips",
      name: "tips",
      builder: (context, state) => TipsScreen(),
    ),
    GoRoute(
      path: "/signup",
      name: 'signup',
      builder: (context, state) => SignUpScreen(),
    ),
    GoRoute(
      path: "/",
      name: 'splash',
      builder: (context, state) => SignInScreen(),
    ),
    GoRoute(
      path: "/signin",
      name: "signin",
      builder: (context, state) => SignInScreen(),
    ),
  ]);
}
