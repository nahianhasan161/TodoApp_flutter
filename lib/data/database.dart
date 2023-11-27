import 'package:hive_flutter/hive_flutter.dart';

class ToDoDataBase {
  List toDoList = [];
  //reference the box
  final _myBox = Hive.box("mybox");

  //fist time User ever openning the app
  void createInitialData() {
    toDoList = [
      ["Make Cake", false],
      ["Make App", false],
    ];
  }

  void loadData() {
    toDoList = _myBox.get("TODOLIST");
  }

  void updateDataBase() {
    _myBox.put("TODOLIST", toDoList);
  }
}
