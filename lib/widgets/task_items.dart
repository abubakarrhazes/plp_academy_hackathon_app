// ignore_for_file: use_super_parameters, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:plp_academy_hackathon_app/models/todo_model.dart';

class TaskItems extends StatelessWidget {
  final TodoModel todoModel; // The ToDo object associated with this item
  final Function(TodoModel)
      onToDoChanged; // Callback function for task completion status change
  final Function(String) onDeleteItem; // Callback function for task deletion

  // Constructor for ToDoItem, taking required parameters
  const TaskItems({
    Key? key,
    required this.todoModel,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin:
          EdgeInsets.only(bottom: 20), // Set margin for the ListTile container
      child: ListTile(
        onTap: () {
          onToDoChanged(
              todoModel); // Invoke callback function when the item is tapped
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20), // Set rounded corners for the ListTile
          ),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: 20, vertical: 5), // Set content padding
        tileColor: Colors.white, // Set background color of the ListTile
        leading: Icon(
          todoModel.isChecked
              ? Icons.check_box
              : Icons
                  .check_box_outline_blank, // Display check box icon based on completion status
          color: Colors.blue, // Set icon color to blue
        ),
        title: Text(
          todoModel.todoName, // Display the task text
          style: TextStyle(
            fontSize: 16,
            color: Colors.brown,
            decoration: todoModel.isChecked
                ? TextDecoration.lineThrough
                : null, // Apply strikethrough decoration if task is completed
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.all(0),
          margin: EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Colors
                .red, // Set background color of the delete button container to red
            borderRadius: BorderRadius.circular(
                5), // Set rounded corners for the delete button container
          ),
          child: IconButton(
            onPressed: () {
              onDeleteItem(todoModel
                  .todoId); // Invoke callback function when delete button is pressed, passing task ID
            },
            icon: Icon(
              Icons.delete,
              size: 18,
              color: Colors.green, // Set icon color to white
            ),
          ),
        ),
      ),
    );
  }
}
