// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:plp_academy_hackathon_app/screens/todo_methods/todo_methods.dart';
import 'package:plp_academy_hackathon_app/utils/utils.dart';
import 'package:plp_academy_hackathon_app/widgets/task_items.dart';

class MainTaskScreen extends StatefulWidget {
  const MainTaskScreen({super.key});

  @override
  State<MainTaskScreen> createState() => _MainTaskScreenState();
}

class _MainTaskScreenState extends State<MainTaskScreen> {
  final TodoMethods todoMethods = TodoMethods();
  final Utils utils = Utils();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 35.0),
              child: Icon(Icons.assignment),
            ),
            SizedBox(width: 8),
            Text(
              'PLP HACKATHON',
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
        backgroundColor: const Color(0xFF883007),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      drawer: Drawer(
        elevation: 0,
        child: Column(
          children: [
            const UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/profile.jpeg"),
              ),
              accountName: Text("Abubakar Nuuman Adam"),
              accountEmail: Text("anuuman@gmail.com"),
            ),
            // Drawer menu items for different task categories
            ListTile(
              title: Text("All Tasks"),
              leading: Icon(Icons.menu_outlined),
              onTap: () =>
                  todoMethods.setSelectedCategory(TaskCategory.all, context),
            ),
            ListTile(
              title: Text("Completed Tasks"),
              leading: Icon(Icons.check_box),
              onTap: () => todoMethods.setSelectedCategory(
                  TaskCategory.completed, context),
            ),
            ListTile(
              title: Text("Pending Tasks"),
              leading: Icon(Icons.incomplete_circle),
              onTap: () => todoMethods.setSelectedCategory(
                  TaskCategory.pending, context),
            ),
            ListTile(
              title: Text("Help"),
              leading: Icon(Icons.help_center),
            ),
            ListTile(
              title: Text("Logout"),
              leading: Icon(Icons.logout),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        child: Column(
          children: [
            // Search bar for filtering tasks (optional)
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: TextField(
                onChanged: (keyword) {
                  // Implement search functionality if needed
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(
                    Icons.search,
                    color: const Color(0xFF272626),
                    size: 20,
                  ),
                  prefixIconConstraints:
                      BoxConstraints(maxHeight: 20, minWidth: 25),
                  border: InputBorder.none,
                  hintText: "Search",
                  hintStyle: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: todoMethods.foundToDo.length,
                itemBuilder: (context, index) => TaskItems(
                  todoModel: todoMethods.foundToDo[index],
                  onToDoChanged: (value) {
                    setState(() {
                      todoMethods.handleToDoChange(value);
                    });
                  },
                  onDeleteItem: (value) {
                    setState(() {
                      todoMethods.deleteToDoItem(value);
                    });
                  },
                ),
              ),
            ),
          ],
        ),
      ),
      // Floating action button to add new task
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Show the dialog to add a new task
          utils.showAddTaskDialog(context);
        },
        tooltip: 'Add New Task',
        child: Icon(Icons.add),
      ),
      backgroundColor: const Color(0xFFCECAB7),
    );
  }
}
