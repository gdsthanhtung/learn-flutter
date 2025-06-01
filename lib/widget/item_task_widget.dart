import 'package:flutter/material.dart';
import '../config/app_colors.dart';

class ItemTaskWidget extends StatelessWidget {
  const ItemTaskWidget({
    super.key,
    required this.item,
    required this.removeTask,
  });
  final Function removeTask;
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
          Expanded(
            child: Text(
              item.name,
              style: const TextStyle(color: AppColors.dark, fontSize: 16),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
          ),
          IconButton(
            icon: const Icon(Icons.delete_outline, color: AppColors.dark),
            onPressed: () {
              showDialog(
                context: context,
                builder:
                    (context) => AlertDialog(
                      title: const Text('Xác nhận'),
                      content: Text(
                        'Bạn có chắc muốn xóa task "${item.name}" không?',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: const Text(
                            'Không',
                            style: TextStyle(color: AppColors.primary),
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            removeTask(item.id);
                            Navigator.of(context).pop();
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text('${item.name} Removed!')),
                            );
                          },
                          child: const Text(
                            'Có',
                            style: TextStyle(color: AppColors.dark),
                          ),
                        ),
                      ],
                    ),
              );
            },
          ),
        ],
      ),
    );
  }
}
