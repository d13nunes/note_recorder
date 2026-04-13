import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

import '../../../../core/error/recording_error.dart';
import '../../../../shared/theme/app_theme.dart';
import '../providers/recording_providers.dart';

class ErrorScreen extends ConsumerWidget {
  final RecordingError error;

  const ErrorScreen({super.key, required this.error});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(32),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Error icon
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.red.withValues(alpha: 0.1),
                ),
                child: const Icon(
                  Icons.error_outline_rounded,
                  size: 40,
                  color: AppColors.red,
                ),
              ),
              const SizedBox(height: 24),

              // Error-specific content
              ...switch (error) {
                MicDenied() => _micDeniedContent(context, ref),
                SpeechToTextDenied() => _speechDeniedContent(context, ref),
                STTFailed(:final message) => _sttFailedContent(
                  context,
                  ref,
                  message,
                ),
                AIFailed(:final message) => _aiFailedContent(
                  context,
                  ref,
                  message,
                ),
              },
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _micDeniedContent(BuildContext context, WidgetRef ref) {
    return [
      Text(
        'Microphone Access Required',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 12),
      const Text(
        'Note Recorder needs access to your microphone to record audio for transcription. Please enable microphone access in Settings.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.grey),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () => openAppSettings(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.ink,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Open Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      const SizedBox(height: 12),
      TextButton(
        onPressed: () => ref.read(recordingProvider.notifier).reset(),
        child: const Text(
          'Go Back',
          style: TextStyle(color: AppColors.grey, fontSize: 15),
        ),
      ),
    ];
  }

  List<Widget> _speechDeniedContent(BuildContext context, WidgetRef ref) {
    return [
      Text(
        'Speech Recognition Required',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 12),
      const Text(
        'This app needs speech recognition permission to transcribe your recordings in real-time. Please enable it in Settings.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.grey),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () => openAppSettings(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.ink,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Open Settings',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      const SizedBox(height: 12),
      TextButton(
        onPressed: () => ref.read(recordingProvider.notifier).reset(),
        child: const Text(
          'Go Back',
          style: TextStyle(color: AppColors.grey, fontSize: 15),
        ),
      ),
    ];
  }

  List<Widget> _sttFailedContent(
    BuildContext context,
    WidgetRef ref,
    String? message,
  ) {
    return [
      Text(
        'Transcription Failed',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 12),
      Text(
        message ??
            'Could not transcribe the audio. Please try recording again.',
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 15,
          height: 1.5,
          color: AppColors.grey,
        ),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () => ref.read(recordingProvider.notifier).reset(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.violet,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Try Again',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
    ];
  }

  List<Widget> _aiFailedContent(
    BuildContext context,
    WidgetRef ref,
    String? message,
  ) {
    return [
      Text(
        'Summary Generation Failed',
        style: Theme.of(context).textTheme.headlineMedium,
        textAlign: TextAlign.center,
      ),
      const SizedBox(height: 12),
      const Text(
        'The audio was transcribed successfully, but we couldn\'t generate the summary. You can retry without re-recording.',
        textAlign: TextAlign.center,
        style: TextStyle(fontSize: 15, height: 1.5, color: AppColors.grey),
      ),
      const SizedBox(height: 32),
      SizedBox(
        width: double.infinity,
        height: 52,
        child: ElevatedButton(
          onPressed: () => ref.read(recordingProvider.notifier).retryAI(),
          style: ElevatedButton.styleFrom(
            backgroundColor: AppColors.violet,
            foregroundColor: AppColors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(14),
            ),
          ),
          child: const Text(
            'Retry Summary',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
        ),
      ),
      const SizedBox(height: 12),
      TextButton(
        onPressed: () => ref.read(recordingProvider.notifier).reset(),
        child: const Text(
          'Start Over',
          style: TextStyle(color: AppColors.grey, fontSize: 15),
        ),
      ),
    ];
  }
}
