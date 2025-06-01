import 'package:flutter/material.dart';
import 'MyTodoList.dart';
import 'model/data_items.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<DataItems> taskList = [];
  void addTask(String taskName) {
    final newTask = DataItems(id: DateTime.now().toString(), name: taskName);
    setState(() {
      taskList.add(newTask);
    });
  }

  void removeTask(String taskId) {
    setState(() {
      taskList.removeWhere((task) => task.id == taskId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyTodoList(taskList, addTask, removeTask),
    );
  }
}
