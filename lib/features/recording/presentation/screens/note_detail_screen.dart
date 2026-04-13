import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

import '../../../../core/utils/duration_format.dart';
import '../../../../shared/theme/app_theme.dart';
import '../../domain/models/action_item.dart';
import '../../domain/models/recording_note.dart';
import '../providers/recording_providers.dart';
import '../widgets/summary_tab.dart';
import '../widgets/actions_tab.dart';
import '../widgets/transcript_tab.dart';

class NoteDetailScreen extends ConsumerStatefulWidget {
  final RecordingNote note;
  final VoidCallback? onBack;

  const NoteDetailScreen({super.key, required this.note, this.onBack});

  @override
  ConsumerState<NoteDetailScreen> createState() => _NoteDetailScreenState();
}

class _NoteDetailScreenState extends ConsumerState<NoteDetailScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  late List<ActionItem> _actionItems;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
    _actionItems = List.from(widget.note.actionItems);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  void _toggleAction(int index) {
    setState(() {
      _actionItems[index] = _actionItems[index].copyWith(
        isDone: !_actionItems[index].isDone,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    final note = widget.note;
    final dateStr = DateFormat('MMM d, yyyy').format(note.createdAt);
    final timeStr = DateFormat('h:mm a').format(note.createdAt);
    final durationStr = note.duration.toShortString();
    final speakerCount = note.transcript.map((e) => e.speaker).toSet().length;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: AppColors.ink),
                    onPressed: widget.onBack ??
                        () => ref.read(recordingProvider.notifier).reset(),
                  ),
                  const Spacer(),
                ],
              ),
            ),

            // Meta line
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                '$dateStr · $timeStr · $durationStr · $speakerCount speaker${speakerCount != 1 ? 's' : ''}',
                style: const TextStyle(
                  fontSize: 13,
                  color: AppColors.grey,
                ),
              ),
            ),
            const SizedBox(height: 8),

            // Title
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                note.title,
                style: const TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 28,
                  color: AppColors.ink,
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Tab bar
            Container(
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: AppColors.greyLight, width: 1),
                ),
              ),
              child: TabBar(
                controller: _tabController,
                labelColor: AppColors.violet,
                unselectedLabelColor: AppColors.grey,
                indicatorColor: AppColors.violet,
                indicatorWeight: 2,
                labelStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
                unselectedLabelStyle: const TextStyle(
                  fontFamily: 'Inter',
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
                tabs: [
                  const Tab(text: 'Summary'),
                  Tab(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const Text('Actions'),
                        if (_actionItems.isNotEmpty) ...[
                          const SizedBox(width: 6),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 6, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.violet,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              '${_actionItems.length}',
                              style: const TextStyle(
                                fontSize: 11,
                                color: AppColors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),
                  ),
                  const Tab(text: 'Transcript'),
                ],
              ),
            ),

            // Tab content
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SummaryTab(note: note),
                  ActionsTab(
                    items: _actionItems,
                    onToggle: _toggleAction,
                  ),
                  TranscriptTab(entries: note.transcript),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

}
