import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';
import '../providers/recording_state.dart';

class ProcessingScreen extends StatelessWidget {
  final ProcessingStep step;

  const ProcessingScreen({super.key, required this.step});

  @override
  Widget build(BuildContext context) {
    final isTranscribing = step == ProcessingStep.transcribing;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Spinner / checkmark
            _StepIndicator(
              label: 'Transcribing audio...',
              isComplete: !isTranscribing,
              isActive: isTranscribing,
            ),
            const SizedBox(height: 24),
            _StepIndicator(
              label: 'Generating summary...',
              isComplete: false,
              isActive: !isTranscribing,
            ),
            const SizedBox(height: 32),
            // Progress dots
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _ProgressDot(isActive: true, isWide: true),
                const SizedBox(width: 6),
                _ProgressDot(
                    isActive: !isTranscribing, isWide: true),
                const SizedBox(width: 6),
                _ProgressDot(isActive: false, isWide: false),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final String label;
  final bool isComplete;
  final bool isActive;

  const _StepIndicator({
    required this.label,
    required this.isComplete,
    required this.isActive,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 56,
          height: 56,
          child: isComplete
              ? Container(
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.green,
                  ),
                  child: const Icon(Icons.check, color: AppColors.white, size: 28),
                )
              : isActive
                  ? const CircularProgressIndicator(
                      color: AppColors.violet,
                      strokeWidth: 3,
                    )
                  : Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: AppColors.greyLight, width: 3),
                      ),
                    ),
        ),
        const SizedBox(width: 16),
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
            color: isActive || isComplete ? AppColors.ink : AppColors.grey,
          ),
        ),
      ],
    );
  }
}

class _ProgressDot extends StatelessWidget {
  final bool isActive;
  final bool isWide;

  const _ProgressDot({required this.isActive, required this.isWide});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: isWide ? 24 : 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: isActive ? AppColors.violet : AppColors.greyLight,
      ),
    );
  }
}
