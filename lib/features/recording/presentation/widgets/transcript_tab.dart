import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';
import '../../domain/models/transcript_entry.dart';

class TranscriptTab extends StatelessWidget {
  final List<TranscriptEntry> entries;

  const TranscriptTab({super.key, required this.entries});

  Color _speakerColor(String speaker) {
    if (speaker.toLowerCase() == 'you') return AppColors.violet;
    // Deterministic color based on speaker name
    final hash = speaker.hashCode;
    final colors = [
      const Color(0xFF3478F6),
      const Color(0xFFFF9500),
      const Color(0xFF34C759),
      const Color(0xFFFF2D55),
      const Color(0xFF5856D6),
    ];
    return colors[hash.abs() % colors.length];
  }

  @override
  Widget build(BuildContext context) {
    if (entries.isEmpty) {
      return const Center(
        child: Text(
          'No transcript available',
          style: TextStyle(color: AppColors.grey, fontSize: 16),
        ),
      );
    }

    return ListView.separated(
      padding: const EdgeInsets.all(24),
      itemCount: entries.length,
      separatorBuilder: (_, _) => const SizedBox(height: 16),
      itemBuilder: (context, index) {
        final entry = entries[index];
        final color = _speakerColor(entry.speaker);

        return Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Timestamp
            SizedBox(
              width: 48,
              child: Text(
                entry.timestamp,
                style: const TextStyle(
                  fontSize: 12,
                  color: AppColors.grey,
                  fontFamily: 'Inter',
                ),
              ),
            ),
            const SizedBox(width: 8),
            // Speaker + text
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                    decoration: BoxDecoration(
                      color: color.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: Text(
                      entry.speaker,
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                        color: color,
                      ),
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    entry.text,
                    style: const TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: AppColors.ink,
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
