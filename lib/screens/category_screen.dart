import 'package:flutter/material.dart';
import '../models/task.dart';
import 'task_detail_screen.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;
  final List<Task> tasks;

  CategoryScreen({required this.category, required this.tasks});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('${category.name} Tasks')),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (ctx, index) {
          final task = tasks[index];
          return ListTile(
            title: Text(task.title),
            subtitle: Text('Due: ${task.dueDate.toLocal()}'),
            trailing: Icon(
              task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
              color: task.isCompleted ? Colors.green : null,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => TaskDetailScreen(task: task),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
