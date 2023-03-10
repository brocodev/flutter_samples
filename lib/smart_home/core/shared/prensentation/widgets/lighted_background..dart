import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';

class LightedBackground extends StatelessWidget {
  const LightedBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        const ColoredBox(color: SHColors.backgroundColor),
        Transform.scale(
          scale: 2,
          alignment: Alignment.topCenter,
          child: Transform(
            transform: Matrix4.identity()
              ..setEntry(3, 2, .001)
              ..rotateY(1.4)
              ..rotateX(.1)
              ..setTranslationRaw(90, -80, 0),
            child: const DecoratedBox(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                  focal: Alignment(0, -1),
                  center: Alignment(0, -.55),
                  colors: SHColors.dimmedLightColors,
                ),
              ),
            ),
          ),
        ),
        child
      ],
    );
  }
}