import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/theme/vice_icons.dart';
import 'package:ui_common/ui_common.dart';

class HeartAndSaveButtons extends StatelessWidget {
  const HeartAndSaveButtons({
    required this.movePercent,
    super.key,
  });

  final double movePercent;

  @override
  Widget build(BuildContext context) {
    final height = 50.h;
    final width = 50.w;
    return Positioned(
      bottom: ui.lerpDouble(.35.sh - height, height, movePercent),
      right: 24.w,
      child: Column(
        children: [
          Container(
            height: height,
            width: width,
            color: Colors.black,
            child: FittedBox(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(ViceIcons.heart, color: Colors.white),
              ),
            ),
          ),
          Container(
            height: height,
            width: width,
            color: Colors.green.shade500,
            child: FittedBox(
              child: IconButton(
                onPressed: () {},
                icon: const Icon(ViceIcons.save, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
