import 'dart:math';

import 'package:flutter/material.dart';

import '../../../../shared/theme/app_theme.dart';

class PillWaveform extends StatefulWidget {
  const PillWaveform({super.key});

  @override
  State<PillWaveform> createState() => _PillWaveformState();
}

class _PillWaveformState extends State<PillWaveform>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  final _random = Random();
  late List<double> _heights;

  static const int _barCount = 40;

  @override
  void initState() {
    super.initState();
    _heights = List.generate(_barCount, (_) => _random.nextDouble());
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150),
    )..addListener(_updateHeights);
    _controller.repeat();
  }

  void _updateHeights() {
    for (var i = 0; i < _barCount; i++) {
      final target = 0.15 + _random.nextDouble() * 0.85;
      _heights[i] += (target - _heights[i]) * 0.3;
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 240,
      height: 96,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(48),
        gradient: LinearGradient(
          colors: [
            AppColors.violet.withValues(alpha: 0.15),
            AppColors.violet.withValues(alpha: 0.08),
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.violet.withValues(alpha: 0.3),
            blurRadius: 24,
            spreadRadius: 4,
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(48),
        child: AnimatedBuilder(
          animation: _controller,
          builder: (context, _) {
            return CustomPaint(
              painter: _WaveformPainter(heights: _heights),
            );
          },
        ),
      ),
    );
  }
}

class _WaveformPainter extends CustomPainter {
  final List<double> heights;

  _WaveformPainter({required this.heights});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = AppColors.violet
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 3;

    final barCount = heights.length;
    final spacing = size.width / (barCount + 1);

    for (var i = 0; i < barCount; i++) {
      final x = spacing * (i + 1);
      final barHeight = heights[i] * size.height * 0.6;
      final top = (size.height - barHeight) / 2;
      canvas.drawLine(
        Offset(x, top),
        Offset(x, top + barHeight),
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant _WaveformPainter oldDelegate) => true;
}
