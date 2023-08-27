import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/constants/constants.dart';
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
    final height = 50.r;
    final width = 50.r;
    final bottom = 1.sh - ViceUIConsts.headerHeight;
    return Positioned(
      bottom: ui.lerpDouble(bottom - height, height, movePercent),
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
