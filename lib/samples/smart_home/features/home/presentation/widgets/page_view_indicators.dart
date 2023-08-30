import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/smart_home/core/theme/sh_colors.dart';
import 'package:ui_common/ui_common.dart';

class PageViewIndicators extends StatelessWidget {
  const PageViewIndicators({
    required this.length,
    required this.pageIndex,
    super.key,
  });

  final int length;
  final double pageIndex;

  @override
  Widget build(BuildContext context) {
    final index = pageIndex;
    return SizedBox(
      height: 12.w,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                for (int i = 0; i < length; i++) ...[
                  const _Dot(),
                  if (i < length - 1) width16,
                ],
              ],
            ),
          ),
          Positioned(
            left: (16.w * index) + (6.w * index),
            child: const _BorderDot(),
          )
        ],
      ),
    );
  }
}

class _BorderDot extends StatelessWidget {
  const _BorderDot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 12.w,
      height: 12.w,
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.orange, width: 2.5),
          color: SHColors.backgroundColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}

class _Dot extends StatelessWidget {
  const _Dot();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 6.w,
      height: 6.w,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: SHColors.hintColor,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
