// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/utilities/dialog_box.dart';
import 'package:todo_app/utilities/todo_tile.dart';

class ToDoPage extends StatefulWidget {
  const ToDoPage({super.key});

  @override
  State<ToDoPage> createState() => _ToDoPageState();
}

class _ToDoPageState extends State<ToDoPage> {
  /* reference the box */
  final _myBox = Hive.box('mybox');
  ToDoDataBase db = ToDoDataBase();
  // text editing controller to access  what the user typed
  /* TextEditingController myController = TextEditingController(); */
  final _controller = TextEditingController();

  @override
  void initState() {
    // if this is the first time ever opting the app,then create default data
    if (_myBox.get("TODOLIST") == null) {
      db.createInitialData();
    } else {
      /* there's already data */
      db.loadData();
    }
    super.initState();
  }
  /* variables */

  /* functions */
  void saveNewTask() {
    setState(() {
      db.toDoList.add([_controller.text, false]);
    });
    db.updateDataBase();
    _controller.clear();
    Navigator.of(context).pop();
  }

  void deleteTask(int index) {
    setState(() {
      db.toDoList.removeAt(index);
    });
    db.updateDataBase();
  }

  void createNewTask() {
    showDialog(
        context: context,
        builder: (context) {
          return DialogBox(
            controller: _controller,
            onSave: saveNewTask,
            onCancle: () => Navigator.of(context).pop(),
          );
        });
  }

  void checkboxChanged(bool? value, int index) {
    setState(() {
      db.toDoList[index][1] = !db.toDoList[index][1];
    });
    db.updateDataBase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        title: Center(child: Text("To Do")),
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: createNewTask,
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: db.toDoList.length,
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: db.toDoList[index][0],
            taskCompleted: db.toDoList[index][1],
            onChanged: (value) => checkboxChanged(value, index),
            deleteFunction: (context) => deleteTask(index),
          );
        },
        /* children: [
          ToDoTile(
            taskName: "make app",
            taskCompleted: true,
            onChanged: (status) {},
          ),
        ], */
      ),
    );
  }
}
