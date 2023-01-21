import 'package:flutter/material.dart';

class LinearGradientContainer extends StatelessWidget {
  const LinearGradientContainer({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Text child;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          transform: GradientRotation(-.4),
          stops: [0, .7, 1],
          colors: [
            Color(0x00ffffff),
            Color(0x10ffffff),
            Color(0x00ffffff),
          ],
        ),
      ),
      child: SafeArea(child: child),
    );
  }
}
