import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

/// Indicates the direction in which the user swiped the card
enum SlideDirection { left, right }

extension SlideDirectoExt on SlideDirection {
  bool get isRight => this == SlideDirection.right;

  bool get isLeft => this == SlideDirection.left;
}

class DraggableWidget extends StatefulWidget {
  /// Widget that can be dragged around the screen
  const DraggableWidget({
    required this.child,
    required this.enableDrag,
    super.key,
    this.onSlideOut,
    this.onPressed,
  });

  /// [ValueChanged] that is called when the user swipe left or right quickly
  final ValueChanged<SlideDirection>? onSlideOut;

  /// [VoidCallback] that is executed when the item is tapped
  final VoidCallback? onPressed;

  /// Allows you to enable or disable being able to drag the widget
  final bool enableDrag;

  /// Widget that is wrapped in order to give it the ability to be draggable
  final Widget child;

  @override
  State<DraggableWidget> createState() => _DraggableWidgetState();
}

class _DraggableWidgetState extends State<DraggableWidget>
    with SingleTickerProviderStateMixin {
  // Animation controller when user releases drag without swiping out
  late final AnimationController restoreController;

  // Global key assigned to the child widget's container to retrieve its
  // position on the screen and its size
  final GlobalKey _widgetKey = GlobalKey();

  // Value of the initial position of the cursor when the user begins dragging
  Offset startOffset = Offset.zero;

  // Value of the cursor position while the user is dragging
  Offset panOffset = Offset.zero;

  // Size of the child widget
  Size size = Size.zero;

  // Lean angle when dragging
  double angle = 0;

  // Value that detects if the user performed a slide out
  bool itWasMadeSlide = false;

  // Width that must be outside the screen for the slide out to take place
  double get outSizeLimit => size.width * .65;

  // Use the global key of the child widget's container to return the position
  // the widget is in
  Offset get currentPosition {
    final renderBox =
        _widgetKey.currentContext?.findRenderObject() as RenderBox?;
    return renderBox?.localToGlobal(Offset.zero) ?? Offset.zero;
  }

  // Gets the value of the tilt angle based on the position in which the widget
  // is and its size
  double get currentAngle {
    return currentPosition.dx < 0
        ? (math.pi * .2) * currentPosition.dx / size.width
        : currentPosition.dx + size.width > 1.sw
            ? (math.pi * .2) *
                (currentPosition.dx + size.width - 1.sw) /
                size.width
            : 0;
  }

  // Assigns the initial touch point when dragging the widget
  void onPanStart(DragStartDetails details) {
    if (restoreController.isAnimating) return;
    setState(() => startOffset = details.globalPosition);
  }

  // Updates the position and tilt angle based on the global position of
  // the touch point and the initial touch point
  void onPanUpdate(DragUpdateDetails details) {
    if (restoreController.isAnimating) return;
    setState(() {
      panOffset = details.globalPosition - startOffset;
      angle = currentAngle;
    });
  }

  // Obtains the speed when the drag is released and the position of the widget
  // and based on these values the slide out function is executed
  void onPanEnd(DragEndDetails details) {
    if (restoreController.isAnimating) return;
    final velocityX = details.velocity.pixelsPerSecond.dx;
    final positionX = currentPosition.dx;
    if (velocityX < -1000 || positionX < -outSizeLimit) {
      itWasMadeSlide = widget.onSlideOut != null;
      widget.onSlideOut?.call(SlideDirection.left);
    }
    if (velocityX > 1000 || positionX > (1.sw - outSizeLimit)) {
      itWasMadeSlide = widget.onSlideOut != null;
      widget.onSlideOut?.call(SlideDirection.right);
    }
    restoreController.forward();
  }

  void restoreControllerListener() {
    if (restoreController.isCompleted) {
      restoreController.reset();
      panOffset = Offset.zero;
      itWasMadeSlide = false;
      angle = 0;
      setState(() {});
    }
  }

  void getChildSize() {
    size =
        (_widgetKey.currentContext?.findRenderObject() as RenderBox?)?.size ??
            Size.zero;
  }

  @override
  void initState() {
    restoreController = AnimationController(
      vsync: this,
      duration: kThemeAnimationDuration,
    )..addListener(restoreControllerListener);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getChildSize();
    });
    super.initState();
  }

  @override
  void dispose() {
    restoreController
      ..removeListener(restoreControllerListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (!widget.enableDrag) {
      return Container(
        key: _widgetKey,
        child: widget.child,
      );
    }
    return GestureDetector(
      onTap: widget.onPressed,
      onPanStart: onPanStart,
      onPanUpdate: onPanUpdate,
      onPanEnd: onPanEnd,
      child: AnimatedBuilder(
        animation: restoreController,
        builder: (context, child) {
          final value = 1 - restoreController.value;
          return Transform.translate(
            offset: panOffset * (itWasMadeSlide ? 1 : value),
            child: Transform.rotate(
              angle: angle * (itWasMadeSlide ? 1 : value),
              child: child,
            ),
          );
        },
        child: Container(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }
}
