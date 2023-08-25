import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/features/home/presentation/widgets/draggable_widget.dart';
import 'package:ui_common/ui_common.dart';

class InfiniteDraggableSlider extends StatefulWidget {
  const InfiniteDraggableSlider({
    required this.itemBuilder,
    super.key,
    this.onTapItem,
    this.shrinkAnimation = const AlwaysStoppedAnimation(1),
    this.index = 0,
    this.itemCount,
  });

  /// [Animation] that shrinks the slider elements
  final Animation<double> shrinkAnimation;

  /// [ValueChanged] that is executed when tapping on the element and returns
  /// the index that it has
  final ValueChanged<int>? onTapItem;

  /// Initial index of the first element displayed in the slider
  final int index;

  /// Maximum number of elements inside the slider
  final int? itemCount;

  /// Widget Function that builds the elements shown in the slider based on its
  /// index and its context
  final Widget Function(BuildContext context, int index) itemBuilder;

  @override
  State<InfiniteDraggableSlider> createState() =>
      _InfiniteDraggableSliderState();
}

class _InfiniteDraggableSliderState extends State<InfiniteDraggableSlider>
    with TickerProviderStateMixin {
  late final AnimationController controller;
  late int index;
  static const inclineLeft = -math.pi * .1;
  static const inclineRight = math.pi * .1;
  SlideDirection direction = SlideDirection.left;

  void animationListener() {
    if (controller.isCompleted) {
      setState(() {
        if (widget.itemCount == ++index) {
          index = 0;
        }
      });
      controller.reset();
    }
  }

  /// Called when the user slides out and assigns the value of the direction
  /// in which the user slid the element
  void onSlideOut(SlideDirection direction) {
    this.direction = direction;
    controller.forward();
  }

  /// Gets the scale of the item according to its position in the [Stack]
  double getScale(int stackIndex) =>
      {
        0: ui.lerpDouble(.6, .9, controller.value)!,
        1: ui.lerpDouble(.9, .95, controller.value)!,
        2: ui.lerpDouble(.95, 1, controller.value)!,
      }[stackIndex] ??
      1.0;

  /// Gets the [Offset] on the item according to its position in the [Stack]
  Offset getOffset(int stackIndex) =>
      {
        0: Offset(ui.lerpDouble(0, -70, controller.value)!, 30),
        1: Offset(ui.lerpDouble(-70, 70, controller.value)!, 30),
        2: const Offset(70, 30) * (1 - controller.value),
      }[stackIndex] ??
      Offset(1.sw * controller.value * (direction.isLeft ? -1 : 1), 0);

  /// Gets the incline angle of the item according to its position in the [Stack]
  double getAngle(int stackIndex) =>
      {
        0: ui.lerpDouble(0, inclineLeft, controller.value)!,
        1: ui.lerpDouble(inclineLeft, inclineRight, controller.value)!,
        2: ui.lerpDouble(inclineRight, 0, controller.value)!,
      }[stackIndex] ??
      math.pi * .1 * controller.value * (direction.isLeft ? -1 : 1);

  @override
  void initState() {
    index = widget.index;
    controller =
        AnimationController(vsync: this, duration: kThemeAnimationDuration)
          ..addListener(animationListener);

    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(animationListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, _) {
        final length = widget.itemCount;
        return Stack(
          children: List.generate(
            4,
            (stackIndex) {
              final scale = getScale(stackIndex);
              final offset = getOffset(stackIndex);
              final angle = getAngle(stackIndex);
              final modIndex = length != null
                  ? (index + 3 - stackIndex) % length
                  : (index + 3 - stackIndex);
              return FadeTransition(
                opacity: stackIndex == 0
                    ? controller
                    : stackIndex != 3
                        ? widget.shrinkAnimation
                        : const AlwaysStoppedAnimation(1),
                child: AnimatedBuilder(
                  animation: widget.shrinkAnimation,
                  builder: (_, child) => _CustomTransform(
                    scale: scale,
                    offset: offset * widget.shrinkAnimation.value,
                    angle: angle * widget.shrinkAnimation.value,
                    child: child!,
                  ),
                  child: DraggableWidget(
                    onPressed: () => widget.onTapItem?.call(modIndex),
                    enableDrag: stackIndex == 3,
                    onSlideOut: onSlideOut,
                    child: widget.itemBuilder(context, modIndex),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class _CustomTransform extends StatelessWidget {
  const _CustomTransform({
    required this.child,
    this.offset = Offset.zero,
    this.angle = 0.0,
    this.scale = 1.0,
  });

  final Offset offset;
  final double angle;
  final double scale;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(offset.dx, offset.dy)
        ..scale(scale),
      child: Transform.rotate(
        angle: angle,
        child: child,
      ),
    );
  }
}
