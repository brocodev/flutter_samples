import 'dart:math' as math;
import 'dart:ui' as ui;

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:flutter_samples/samples/vice_app/features/home/presentation/widgets/infinite_draggable_slider.dart';
import 'package:ui_common/ui_common.dart';

class MagazinesCube3DPageView extends StatefulWidget {
  const MagazinesCube3DPageView({
    required this.magazines,
    required this.initialIndex,
    required this.onPageChanged,
    required this.sizePercent,
    super.key,
  });

  final List<Magazine> magazines;
  final ValueChanged<int> onPageChanged;
  final int initialIndex;
  final double sizePercent;

  @override
  State<MagazinesCube3DPageView> createState() =>
      _MagazinesCube3DPageViewState();
}

class _MagazinesCube3DPageViewState extends State<MagazinesCube3DPageView> {
  late final PageController pageController;

  /// Value in decimals of the page displayed in the [PageView]
  late double page;

  Widget buildCustomHero(_, Animation<double> animation, __, ___, ____) {
    return InfiniteDraggableSlider(
      index: page.floor(),
      itemCount: widget.magazines.length,
      shrinkAnimation: Tween<double>(begin: 1, end: 0).animate(animation),
      itemBuilder: (_, index) => MagazineCoverImage(
        magazine: widget.magazines[index],
      ),
    );
  }

  void _pageListener() {
    setState(() {
      page = pageController.page ?? 0;
    });
  }

  @override
  void initState() {
    page = widget.initialIndex.toDouble();
    pageController = PageController(initialPage: widget.initialIndex)
      ..addListener(_pageListener);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: widget.magazines.length,
      controller: pageController,
      onPageChanged: (value) => widget.onPageChanged(value),
      clipBehavior: Clip.none,
      itemBuilder: (_, index) {
        final magazine = widget.magazines[index];
        final percent = index - page;
        final isComingOut = (index - page) <= 0;
        return Transform(
          alignment: isComingOut ? Alignment.centerRight : Alignment.centerLeft,
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.014)
            ..rotateY(-(math.pi / 180 * 10) * percent),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Positioned.fill(
                top: -200 * widget.sizePercent + -50,
                bottom: -400 * widget.sizePercent,
                child: TweenAnimationBuilder<double>(
                  duration: const Duration(milliseconds: 600),
                  curve: Curves.fastOutSlowIn,
                  tween: Tween(begin: 1, end: 0),
                  builder: (_, value, child) {
                    return Transform.translate(
                      offset: Offset(0, 50 * value),
                      child: Opacity(opacity: 1 - value, child: child),
                    );
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        magazine.assetImage,
                        fit: BoxFit.cover,
                      ),
                      ClipRect(
                        clipBehavior: Clip.antiAlias,
                        child: BackdropFilter(
                          filter: ui.ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                          child: const ColoredBox(color: Colors.black26),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                top: context.mediaQuery.padding.top,
                bottom: -.8.sh * widget.sizePercent,
                child: Center(
                  child: Hero(
                    tag: magazine.id,
                    flightShuttleBuilder: buildCustomHero,
                    child: MagazineCoverImage(
                      magazine: magazine,
                      height: ui.lerpDouble(.35.sh, .25.sh, widget.sizePercent),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
