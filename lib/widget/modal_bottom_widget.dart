import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class ModalBottomWidget extends StatelessWidget {
  ModalBottomWidget({super.key, required this.addTask});
  final Function addTask;
  final TextEditingController controller = TextEditingController();

  void _handleOnPress(BuildContext context) {
    final taskName = controller.text.trim();
    if (taskName.isNotEmpty) {
      addTask(taskName);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Task "$taskName" added!')));
      Navigator.pop(context);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Please enter a task name')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              decoration: InputDecoration(
                labelText: 'Enter your task...',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: BorderSide(color: AppColors.primary, width: 1.0),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(4.0),
                  borderSide: const BorderSide(
                    color: AppColors.dark,
                    width: 2.0,
                  ),
                ),
                focusColor: AppColors.dark,
              ),
            ),
            const SizedBox(height: 16.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  padding: const EdgeInsets.all(12.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4.0),
                  ),
                ),
                onPressed: () {
                  _handleOnPress(context);
                },
                child: const Text(
                  'Add Task',
                  style: TextStyle(fontSize: 16, color: AppColors.light),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
