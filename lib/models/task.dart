import 'dart:ui';

class Task {
  String title;
  String category;
  bool isCompleted;
  DateTime dueDate;
  String priority; // High, Medium, Low

  Task({
    required this.title,
    required this.category,
    this.isCompleted = false,
    required this.dueDate,
    required this.priority,
  });
}

class Category {
  String name;
  Color color;

  Category({required this.name, required this.color});
}
