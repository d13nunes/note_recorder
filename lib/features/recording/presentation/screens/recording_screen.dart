import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/services/adapty_service.dart';
import '../../../../shared/theme/app_theme.dart';
import '../providers/recording_providers.dart';
import '../widgets/pill_waveform.dart';
import '../widgets/timer_display.dart';
import 'error_screen.dart';
import 'note_detail_screen.dart';
import 'processing_screen.dart';

class RecordingScreen extends ConsumerWidget {
  const RecordingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(recordingProvider);

    return state.when(
      idle: () => _IdleView(ref: ref),
      recording: (elapsed, transcript) =>
          _RecordingView(ref: ref, elapsed: elapsed, transcript: transcript),
      processing: (step) => ProcessingScreen(step: step),
      done: (note) => NoteDetailScreen(note: note),
      error: (error) => ErrorScreen(error: error),
    );
  }
}

class _IdleView extends StatelessWidget {
  final WidgetRef ref;

  const _IdleView({required this.ref});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Ready to Record',
                style: TextStyle(
                  fontFamily: 'DMSerifDisplay',
                  fontSize: 28,
                  color: AppColors.ink,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                'Tap the microphone to start',
                style: TextStyle(fontSize: 16, color: AppColors.grey),
              ),
              const SizedBox(height: 48),
              GestureDetector(
                onTap: () =>
                    ref.read(recordingProvider.notifier).startRecording(),
                child: Container(
                  width: 96,
                  height: 96,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.violet,
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.violet.withValues(alpha: 0.4),
                        blurRadius: 24,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.mic,
                    size: 40,
                    color: AppColors.white,
                  ),
                ),
              ),
              const SizedBox(height: 32),
              TextButton.icon(
                onPressed: () async {
                  await AdaptyService.showPaywall();
                },
                icon: const Icon(Icons.workspace_premium),
                label: const Text('Show Paywall'),
                style: TextButton.styleFrom(foregroundColor: AppColors.violet),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _RecordingView extends StatelessWidget {
  final WidgetRef ref;
  final Duration elapsed;
  final String transcript;

  const _RecordingView({
    required this.ref,
    required this.elapsed,
    required this.transcript,
  });

  void _showCancelConfirmation(BuildContext context, WidgetRef ref) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Stop Recording?'),
        content: const Text(
          'Your recording will be lost and cannot be recovered.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('Keep Recording'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              ref.read(recordingProvider.notifier).cancelRecording();
            },
            style: TextButton.styleFrom(foregroundColor: AppColors.red),
            child: const Text('Discard'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            // Top bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextButton(
                    onPressed: () => _showCancelConfirmation(context, ref),
                    child: Text(
                      'Cancel',
                      style: TextStyle(fontSize: 16, color: AppColors.grey),
                    ),
                  ),
                  // Recording badge
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 12,
                      vertical: 6,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.violetSoft,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        _PulsingDot(),
                        const SizedBox(width: 6),
                        const Text(
                          'Recording',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                            color: AppColors.violet,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Centre content
            const Spacer(),
            TimerDisplay(elapsed: elapsed),
            const SizedBox(height: 32),
            const PillWaveform(),
            const SizedBox(height: 24),

            // Live transcript
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: SingleChildScrollView(
                  reverse: true,
                  child: Text(
                    transcript.isEmpty ? 'Listening…' : transcript,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 15,
                      height: 1.5,
                      color: transcript.isEmpty
                          ? AppColors.grey
                          : AppColors.ink.withValues(alpha: 0.7),
                    ),
                  ),
                ),
              ),
            ),

            // Bottom button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton.icon(
                  onPressed: () =>
                      ref.read(recordingProvider.notifier).stopRecording(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.ink,
                    foregroundColor: AppColors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  icon: Container(
                    width: 20,
                    height: 20,
                    decoration: BoxDecoration(
                      color: AppColors.violet,
                      borderRadius: BorderRadius.circular(4),
                    ),
                  ),
                  label: const Text(
                    'Stop Recording',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PulsingDot extends StatefulWidget {
  @override
  State<_PulsingDot> createState() => _PulsingDotState();
}

class _PulsingDotState extends State<_PulsingDot>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    )..repeat(reverse: true);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return Container(
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.violet.withValues(
              alpha: 0.5 + _controller.value * 0.5,
            ),
          ),
        );
      },
    );
  }
}
