import 'package:flutter/material.dart';
import '../models/task.dart';
import 'add_task_screen.dart';
import 'task_detail_screen.dart';
import 'category_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Task> tasks = [
    Task(title: 'Finish homework', category: 'Study', dueDate: DateTime.now().add(Duration(days: 1)), priority: 'High'),
    Task(title: 'Buy groceries', category: 'Personal', dueDate: DateTime.now().add(Duration(days: 2)), priority: 'Low'),
  ];

  List<Category> categories = [
    Category(name: 'Study', color: Colors.blue),
    Category(name: 'Personal', color: Colors.green),
    Category(name: 'Work', color: Colors.orange),
  ];

  void _addTask(Task task) {
    setState(() {
      tasks.add(task);
    });
  }

  void _addCategory(Category category) {
    setState(() {
      categories.add(category);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: categories.length,
        itemBuilder: (ctx, index) {
          final category = categories[index];
          final categoryTasks = tasks.where((task) => task.category == category.name).toList();

          return ListTile(
            title: Text(category.name),
            tileColor: category.color.withOpacity(0.2), // Sử dụng màu sắc của danh mục
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CategoryScreen(category: category, tasks: categoryTasks),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => AddTaskScreen(onAddTask: _addTask),
            ),
          );
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
