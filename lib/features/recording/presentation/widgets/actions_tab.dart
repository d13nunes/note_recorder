import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';
import '../../domain/models/action_item.dart';

class ActionsTab extends StatelessWidget {
  final List<ActionItem> items;
  final void Function(int index) onToggle;

  const ActionsTab({super.key, required this.items, required this.onToggle});

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) {
      return const Center(
        child: Text(
          'No action items found',
          style: TextStyle(color: AppColors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: items.length,
      separatorBuilder: (_, _) => const SizedBox(height: 4),
      itemBuilder: (context, index) {
        final item = items[index];
        return InkWell(
          onTap: () => onToggle(index),
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: item.isDone ? AppColors.green : Colors.transparent,
                    border: Border.all(
                      color: item.isDone ? AppColors.green : AppColors.grey,
                      width: 2,
                    ),
                  ),
                  child: item.isDone
                      ? const Icon(Icons.check,
                          size: 14, color: AppColors.white)
                      : null,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    item.text,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.4,
                      color: item.isDone ? AppColors.grey : AppColors.ink,
                      decoration:
                          item.isDone ? TextDecoration.lineThrough : null,
                      decorationColor: AppColors.grey,
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
