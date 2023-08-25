import 'dart:ui';

import 'package:flutter/material.dart';

class CustomTweenAnimation extends StatelessWidget {
  const CustomTweenAnimation({
    required this.child,
    this.onlyScale = false,
    super.key,
  });

  final Widget child;
  final bool onlyScale;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 1, end: 0),
      builder: (_, value, child) {
        if (onlyScale) {
          return Transform.scale(
            scale: lerpDouble(1, -1, value)?.clamp(0, 1),
            child: child,
          );
        }
        return Transform.translate(
          offset: Offset(0, 50 * value),
          child: Opacity(opacity: 1 - value, child: child),
        );
      },
      child: child,
    );
  }
}
