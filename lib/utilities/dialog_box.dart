// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, prefer_typing_uninitialized_variables, must_be_immutable, sized_box_for_whitespace

import 'package:flutter/material.dart';
import 'package:todo_app/utilities/primary_button.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancle;
  DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancle,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow,
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            /* get user input */
            TextField(
              controller: controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), hintText: "Add a new task"),
            ),
            /* save button */
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                PrimaryButton(
                  text: "Save",
                  onPressed: onSave,
                ),
                SizedBox(width: 4),
                PrimaryButton(text: "Cancle", onPressed: onCancle)
              ],
            )
            /* cancle button */
          ],
        ),
      ),
    );
  }
}
