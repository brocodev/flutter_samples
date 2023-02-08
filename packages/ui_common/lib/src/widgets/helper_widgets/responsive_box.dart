import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/// [SizedBox] implementation with responsive values
class ResponsiveBox extends StatelessWidget {
  /// [SizedBox] implementation with responsive values
  const ResponsiveBox({
    Key? key,
    this.child,
    this.height,
    this.width,
  }) : super(key: key);

  /// Creates a box whose [width] and [height] are equal.
  const ResponsiveBox.square({super.key, this.child, double? dimension})
      : width = dimension,
        height = dimension;

  /// Creates a box that will become as large as its parent allows.
  const ResponsiveBox.expand({super.key, this.child})
      : width = double.infinity,
        height = double.infinity;

  /// Creates a box that will become as small as its parent allows.
  const ResponsiveBox.shrink({super.key, this.child})
      : width = 0.0,
        height = 0.0;

  /// Creates a box with the specified size.
  ResponsiveBox.fromSize({super.key, this.child, Size? size})
      : width = size?.width,
        height = size?.height;

  /// Child
  final Widget? child;

  /// Height
  final double? height;

  /// Width
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height?.h,
      width: width?.w,
      child: child,
    );
  }
}
