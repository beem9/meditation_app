import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meditation_app/pages/exercise_page.dart';
import 'package:meditation_app/pages/home_page.dart';
import 'package:meditation_app/pages/meditation_page.dart';
import 'package:meditation_app/pages/music_page.dart';
import 'package:meditation_app/pages/personal_tips_page.dart';
import 'package:meditation_app/pages/signin.dart';
import 'package:meditation_app/pages/signup.dart';
import 'package:meditation_app/pages/tips_page.dart';
import 'package:meditation_app/pages/vid_test.dart';
import 'package:meditation_app/providers/auth_provider.dart';
import 'package:meditation_app/providers/exercise_provider.dart';
import 'package:meditation_app/providers/meditation_provider.dart';
import 'package:meditation_app/providers/music_provider.dart';
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
    ChangeNotifierProvider(
      create: (context) => ExerciseProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
    ),
    ChangeNotifierProvider(
      create: (context) => MeditationProvider(),
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
      path: "/ptips",
      name: "ptips",
      builder: (context, state) => PersonalTipsScreen(),
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
    GoRoute(
      path: "/exer",
      name: "exer",
      builder: (context, state) => ExerciseScreen(),
    ),
    GoRoute(
      path: "/music",
      name: "music",
      builder: (context, state) => MusicScreen(),
    ),
    GoRoute(
      path: "/med",
      name: "med",
      builder: (context, state) => MeditationScreen(),
    ),
    GoRoute(
      path: "/video",
      name: "video",
      builder: (context, state) => VideoPage(link: state.extra as String),
    ),
  ]);
}
