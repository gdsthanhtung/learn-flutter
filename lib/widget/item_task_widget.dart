import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({super.key, required this.item});
  final dynamic item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
      margin: const EdgeInsets.only(bottom: 12.0),
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.light,
        boxShadow: [
          BoxShadow(
            color: AppColors.dark.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 2),
          ),
        ],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            item.name,
            style: TextStyle(color: AppColors.dark, fontSize: 16),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.dark),
            onPressed: () {
              // Action to perform when the button is pressed
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text('${item.name} Removed!')));
            },
          ),
        ],
      ),
    );
  }
}
