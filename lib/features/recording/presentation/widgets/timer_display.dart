import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';

class TimerDisplay extends StatelessWidget {
  final Duration elapsed;

  const TimerDisplay({super.key, required this.elapsed});

  @override
  Widget build(BuildContext context) {
    final minutes = elapsed.inMinutes.toString().padLeft(2, '0');
    final seconds = (elapsed.inSeconds % 60).toString().padLeft(2, '0');

    return Text(
      '$minutes:$seconds',
      style: const TextStyle(
        fontFamily: 'Inter',
        fontSize: 80,
        fontWeight: FontWeight.w200,
        color: AppColors.ink,
        letterSpacing: -2,
      ),
    );
  }
}
