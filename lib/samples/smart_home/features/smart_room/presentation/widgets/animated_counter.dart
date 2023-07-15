import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class AnimatedCounter extends StatefulWidget {
  const AnimatedCounter({
    required this.value,
    super.key,
  });

  final int value;

  @override
  State<AnimatedCounter> createState() => _AnimatedCounterState();
}

class _AnimatedCounterState extends State<AnimatedCounter> {
  Widget _transition(Widget child, Animation<double> animation) {
    return SlideTransition(
      position: Tween(
        begin: const Offset(0, .5),
        end: Offset.zero,
      ).animate(animation),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for (final n in '${widget.value}'.split(''))
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 100),
            transitionBuilder: _transition,
            child: Text(n, key: Key(n)),
          ),
      ],
    );
  }
}

class CounterSlider extends StatefulWidget {
  const CounterSlider({Key? key}) : super(key: key);

  @override
  State<CounterSlider> createState() => _CounterSliderState();
}

class _CounterSliderState extends State<CounterSlider> {
  int count = 10;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AnimatedCounter(value: count),
        height28,
        Slider(
          max: 100,
          min: 0,
          value: count.toDouble(),
          onChanged: (value) {
            setState(() {
              count = value.toInt();
            });
          },
        )
      ],
    );
  }
}
