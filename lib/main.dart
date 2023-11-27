// ignore_for_file: prefer_const_constructors

import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'package:todo_app/pages/todo_page.dart';

void main() async {
  /* hive init */
  await Hive.initFlutter();
  /* open a box */
  var box = await Hive.openBox('mybox');
  /* run app */
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        appBarTheme: AppBarTheme(backgroundColor: Colors.yellow),
      ),
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Expanded(
        child: Column(
          children: [
            Image.asset('assets/images/todo-app.png'),
          ],
        ),
      ),
      backgroundColor: Colors.yellow,
      nextScreen: ToDoPage(),
      splashIconSize: 450,
      duration: 4000,
      splashTransition: SplashTransition.fadeTransition,
    );
  }
}
