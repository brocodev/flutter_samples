import 'package:flutter/material.dart';

/// {@template [BuilderPersistentDelegate]}
/// Builder persistent delegate, can be used to make complex animations with
/// [CustomScrollView]
/// {@endtemplate}
///
class BuilderPersistentDelegate extends SliverPersistentHeaderDelegate {
  /// {@macro [BuilderPersistentDelegate]}
  BuilderPersistentDelegate({
    required double maxExtent,
    required double minExtent,
    required this.builder,
  })  : _maxExtent = maxExtent,
        _minExtent = minExtent;

  final double _maxExtent;
  final double _minExtent;

  /// Builder function that grants the percentage of change in the scroll of
  /// the header, this value is useful for making animations
  final Widget Function(double percent) builder;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return builder(shrinkOffset / _maxExtent);
  }

  @override
  double get maxExtent => _maxExtent;

  @override
  double get minExtent => _minExtent;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      this != oldDelegate;
}
