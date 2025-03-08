import 'package:flutter/material.dart';
import '../models/task.dart';

class AddTaskScreen extends StatefulWidget {
  final Function(Task) onAddTask;

  AddTaskScreen({required this.onAddTask});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _titleController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime _selectedDate = DateTime.now();

  void _submitTask() {
    final title = _titleController.text;
    final category = _categoryController.text;
    if (title.isEmpty || category.isEmpty) {
      return;
    }

    final newTask = Task(
      title: title,
      category: category,
      dueDate: _selectedDate, priority: '',
    );

    widget.onAddTask(newTask);
    Navigator.pop(context);
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate)
      setState(() {
        _selectedDate = picked;
      });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Task')),
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
            Row(
              children: <Widget>[
                Text('Due Date: ${_selectedDate.toLocal()}'),
                IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
              ],
            ),
            ElevatedButton(
              onPressed: _submitTask,
              child: Text('Add Task'),
            ),
          ],
        ),
      ),
    );
  }
}
