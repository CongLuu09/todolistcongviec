import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetailScreen extends StatefulWidget {
  final Task task;

  TaskDetailScreen({required this.task});

  @override
  _TaskDetailScreenState createState() => _TaskDetailScreenState();
}

class _TaskDetailScreenState extends State<TaskDetailScreen> {
  late TextEditingController _titleController;
  late TextEditingController _priorityController;
  late TextEditingController _categoryController;

  @override
  void initState() {
    _titleController = TextEditingController(text: widget.task.title);
    _categoryController = TextEditingController(text: widget.task.category);
    _priorityController = TextEditingController(text: widget.task.priority);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Details')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Task Title'),
            ),
            TextField(
              controller: _categoryController,
              decoration: InputDecoration(labelText: 'Category'),
            ),
            TextField(
              controller: _priorityController,
              decoration: InputDecoration(labelText: 'Priority'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  widget.task.title = _titleController.text;
                  widget.task.category = _categoryController.text;
                  widget.task.priority = _priorityController.text;
                });
                Navigator.pop(context);
              },
              child: Text('Save Changes'),
            ),
          ],
        ),
      ),
    );
  }
}
