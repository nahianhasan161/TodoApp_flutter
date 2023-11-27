// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CounterPage(),
    );
  }
}

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override

  /* variables */
  // ignore: override_on_non_overriding_member
  int _counter = 0;

/* functions*/

  void increamentCounter() {
    setState(() {
      _counter++;
    });
  }

  void decreamentCounter() {
    setState(() {
      _counter--;
    });
  }

  void resetCounter() {
    setState(() {
      _counter = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(_counter.toString()),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: increamentCounter, icon: Icon(Icons.add)),
              TextButton(
                onPressed: resetCounter,
                child: Text("Reset"),
              ),
              IconButton(
                  onPressed: decreamentCounter, icon: Icon(Icons.remove)),
            ],
          )
        ],
      )),
      floatingActionButton: FloatingActionButton(
        onPressed: increamentCounter,
        tooltip: "Increment",
        child: Icon(Icons.add),
      ),
    );
  }
}
