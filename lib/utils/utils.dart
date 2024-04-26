import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plp_academy_hackathon_app/screens/todo_methods/todo_methods.dart';

class Utils{


  final TodoMethods todoMethods = TodoMethods();

  // Method to show dialog for adding a new task
  Future<void> showAddTaskDialog(BuildContext context) async {
    String newTaskText = ''; // Text entered by the user for the new task

    await showDialog(
      context: context,
      builder: (BuildContext dialogContext) {
        return AlertDialog(
          title: Text('Add New Task'),
          content: TextField(
            autofocus: true,
            onChanged: (value) {
              newTaskText = value; // Update newTaskText as the user types
            },
            decoration: InputDecoration(hintText: 'Enter task...'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(dialogContext); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Add the new task to the list and update the tasks
                todoMethods.addNewTask(newTaskText);
                Navigator.pop(dialogContext); // Close the dialog
              },
              child: Text('Add'),
            ),
          ],
        );
      },
    );
  }
}