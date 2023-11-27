import 'package:flutter/material.dart';
import 'package:todo_app/old_main.dart';

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
  CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  @override

  /* variables */
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
        child: Icon(Icons.add),
        tooltip: "Increment",
      ),
    );
  }
}
