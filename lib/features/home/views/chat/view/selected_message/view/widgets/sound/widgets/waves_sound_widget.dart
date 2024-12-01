import 'package:flutter/material.dart';

class SoundWaveformWidget extends StatefulWidget {
  final int count;
  final double minHeight;
  final double maxHeight;
  final int durationInMilliseconds;
  final Color? color;

  const SoundWaveformWidget({
    super.key,
    required this.count,
    required this.minHeight,
    required this.maxHeight,
    this.durationInMilliseconds = 2500,
    this.color,
  });

  @override
  State<SoundWaveformWidget> createState() => _SoundWaveformWidgetState();
}

class _SoundWaveformWidgetState extends State<SoundWaveformWidget>
    with TickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
        vsync: this,
        duration: Duration(
          milliseconds: widget.durationInMilliseconds,
        ),
    )..repeat();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final count = widget.count;
    final minHeight = widget.minHeight;
    final maxHeight = widget.maxHeight;
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: AnimatedBuilder(
        animation: controller,
        builder: (c, child) {
          double t = controller.value;
          int current = (count * t).floor();
          return Row(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
                  (i) => AnimatedContainer(
                duration: Duration(
                    milliseconds: widget.durationInMilliseconds ~/ count),
                margin: i == (count - 1)
                    ? EdgeInsets.zero
                    : const EdgeInsets.only(right: 5),
                height: (i == current ||
                    i == (current + (count / 4)) ||
                    i == (current - (count / 4)))
                    ? maxHeight
                    : minHeight,
                width: 4,
                decoration: BoxDecoration(
                  color: widget.color,
                  borderRadius: BorderRadius.circular(9999),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
