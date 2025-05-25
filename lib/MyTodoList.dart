import 'package:flutter/material.dart';
import 'config/app_colors.dart';
import 'widget/item_task_widget.dart';
import 'widget/modal_bottom_widget.dart';
import 'model/data_items.dart';

class MyTodoList extends StatelessWidget {
  const MyTodoList({super.key});

  static const List<DataItems> tasks = [
    DataItems(id: '1', name: 'Task 1'),
    DataItems(id: '2', name: 'Task 2'),
    DataItems(id: '3', name: 'Task 3'),
    DataItems(id: '4', name: 'Task 4'),
    DataItems(id: '5', name: 'Task meo meo'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: const Text(
          'Todo List',
          style: TextStyle(fontSize: 24, color: AppColors.light),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
          child: Column(
            children: tasks.map((item) => ItemTaskWidget(item: item)).toList(),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.blue,
        child: const Icon(Icons.add, color: AppColors.light),
        onPressed: () {
          showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(top: Radius.circular(8.0)),
            ),
            isScrollControlled: true,
            context: context,
            builder: (context) {
              return ModalBottomWidget();
            },
          );
        },
      ),
    );
  }
}
