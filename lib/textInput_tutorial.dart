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
  String greetingMessage = "";
  /* functions */
  void greetUser() {
    String userName = myController.text;
    setState(() {
      // ignore: prefer_interpolation_to_compose_strings
      greetingMessage = "Hello, " + userName;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Padding(
      padding: EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(greetingMessage),
          TextField(
            controller: myController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Enter Your Name",
            ),
          ),
          ElevatedButton(onPressed: greetUser, child: Text("Submit"))
        ],
      ),
    )));
  }
}
