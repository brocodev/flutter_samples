import 'package:flutter/material.dart';
import 'package:flutter_samples/core/theme/colors.dart';
import 'package:ui_common/ui_common.dart';

class PageViewIndicators extends StatelessWidget {
  const PageViewIndicators({
    Key? key,
    required this.length,
    required this.currentPercentIndex,
  }) : super(key: key);

  final int length;
  final double currentPercentIndex;

  @override
  Widget build(BuildContext context) {
    final index = currentPercentIndex;
    return SizedBox(
      height: 12.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              for (int i = 0; i < length; i++) ...[
                const _Dot(),
                spaceH16,
              ],
            ],
          ),
          AnimatedPositioned(
            duration: kThemeAnimationDuration,
            left: (16.w * index) + (6.w * index),
            child: const _BorderDot(),
          ),
          // Positioned(
          //   left: (16.w * index) + (6.w * index),
          //   child: const _BorderDot(),
          // )
        ],
      ),
    );
  }
}

class _BorderDot extends StatelessWidget {
  const _BorderDot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12.w,
      height: 12.w,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.orange, width: 2.5),
        color: SHColors.scaffoldBackground,
        shape: BoxShape.circle,
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 6.w,
      height: 6.w,
      decoration: const BoxDecoration(
        color: SHColors.hintColor,
        shape: BoxShape.circle,
      ),
    );
  }
}
