import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/constants/constants.dart';
import 'package:ui_common/ui_common.dart';

class RectanglePageViewIndicators extends StatelessWidget {
  const RectanglePageViewIndicators({
    required this.percent,
    required this.indexNotifier,
    required this.length,
    super.key,
  });

  final double percent;
  final ValueNotifier<int> indexNotifier;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: null,
      bottom: lerpDouble(.05.sh, -ViceUIConsts.headerHeight, percent),
      child: ValueListenableBuilder<int>(
        valueListenable: indexNotifier,
        builder: (__, value, _) => Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: List.generate(
            length,
            (index) {
              final isSelected = index == value;
              return AnimatedContainer(
                duration: kThemeAnimationDuration,
                margin: index != (length - 1) ? 4.edgeInsetsR : null,
                height: isSelected ? 5.r : 3.r,
                width: isSelected ? 12.r : 8.r,
                color: isSelected ? Colors.white : Colors.white38,
              );
            },
          ),
        ),
      ),
    );
  }
}
