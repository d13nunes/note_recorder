import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';
import '../../domain/models/recording_note.dart';

class SummaryTab extends StatelessWidget {
  final RecordingNote note;

  const SummaryTab({super.key, required this.note});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24),
      children: [
        // AI Summary card
        Container(
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: AppColors.violet.withValues(alpha: 0.08),
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: AppColors.violet.withValues(alpha: 0.15),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Icon(Icons.auto_awesome,
                      size: 16, color: AppColors.violet),
                  const SizedBox(width: 6),
                  const Text(
                    'AI Summary',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w600,
                      color: AppColors.violet,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                note.summary,
                style: const TextStyle(
                  fontSize: 15,
                  height: 1.5,
                  color: AppColors.ink,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 28),

        // Key Highlights
        if (note.keyHighlights.isNotEmpty) ...[
          const Text(
            'Key Highlights',
            style: TextStyle(
              fontFamily: 'Inter',
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.ink,
            ),
          ),
          const SizedBox(height: 12),
          ...note.keyHighlights.map(
            (highlight) => Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  border: Border(
                    left: BorderSide(
                      color: AppColors.violet,
                      width: 3,
                    ),
                  ),
                  color: AppColors.violetSoft,
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                  ),
                ),
                child: Text(
                  highlight,
                  style: const TextStyle(
                    fontSize: 14,
                    height: 1.5,
                    color: AppColors.ink,
                  ),
                ),
              ),
            ),
          ),
        ],
      ],
    );
  }
}
