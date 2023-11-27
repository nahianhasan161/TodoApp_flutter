// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  // text editing controller to access  what the user typed
  TextEditingController myController = TextEditingController();

  /* variables */

  /* functions */

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text("Greetings"));
  }
}
