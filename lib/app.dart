import 'package:flutter/material.dart';

import 'features/recording/presentation/screens/recording_screen.dart';
import 'shared/theme/app_theme.dart';

class NoteRecorderApp extends StatelessWidget {
  const NoteRecorderApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recorder',
      debugShowCheckedModeBanner: true,
      theme: AppTheme.light,
      home: const RecordingScreen(),
    );
  }
}
