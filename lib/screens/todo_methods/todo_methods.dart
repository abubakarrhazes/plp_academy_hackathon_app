import 'package:flutter/cupertino.dart';
import 'package:plp_academy_hackathon_app/models/todo_model.dart';


enum TaskCategory {
  all,
  completed,
  pending,
}

class TodoMethods{


  List<TodoModel> todosList = TodoModel.todoListTasks(); // List of all tasks
  List<TodoModel> foundToDo = []; // List of tasks to display based on category
  TaskCategory _selectedCategory = TaskCategory.all;





  // Method to update the displayed tasks based on selected category
  void _updateTasks() {

      switch (_selectedCategory) {
        case TaskCategory.all:
          _foundToDo = todosList; // Display all tasks
          break;
        case TaskCategory.completed:
          _foundToDo = todosList.where((todo) => todo.isChecked).toList(); // Display completed tasks
          break;
        case TaskCategory.pending:
          _foundToDo = todosList.where((todo) => !todo.isChecked).toList(); // Display pending tasks
          break;
      }
  }

  // Method to handle task completion status change
  void handleToDoChange(todo) {

      todo.isChecked = !todo.isDone; // Toggle completion status
      _updateTasks(); // Update displayed tasks after status change
  }

  // Method to handle task deletion
  void deleteToDoItem(String id) {

      todosList.removeWhere((item) => item.todoId == id); // Remove task from list
      _updateTasks(); // Update displayed tasks after deletion

  }

  // Method to add a new task to the list
  void addNewTask(String taskText) {
    if (taskText.isNotEmpty) {
      // Generate a unique ID for the new task (you may use a different approach for IDs)
      String newTaskId = UniqueKey().toString();

      // Create a new ToDo object for the new task
      TodoModel newTask = TodoModel(
        todoId: newTaskId as String,
        todoName: taskText,
        isChecked: false,
      );

      // Add the new task to the todosList

        todosList.add(newTask);
        _updateTasks(); // Update the displayed tasks list

    }
  }

  // Method to set the selected task category
  void setSelectedCategory(TaskCategory category, BuildContext context) {

      _selectedCategory = category; // Update selected category
      _updateTasks(); // Update displayed tasks based on new category


    // Close the drawer and navigate to the tasks screen
    Navigator.pop(context); // Close the drawer
  }

}