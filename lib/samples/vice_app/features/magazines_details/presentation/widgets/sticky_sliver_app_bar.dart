import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:ui_common/ui_common.dart';

class StickySliverAppBar extends StatefulWidget {
  const StickySliverAppBar({
    required this.sizePercent,
    required this.indexNotifier,
    super.key,
  });

  final double sizePercent;
  final ValueNotifier<int> indexNotifier;

  @override
  State<StickySliverAppBar> createState() => _StickySliverAppBarState();
}

class _StickySliverAppBarState extends State<StickySliverAppBar> {
  late final PageController controller;

  void indexListener() {
    controller.animateToPage(
      widget.indexNotifier.value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.indexNotifier.value);
    widget.indexNotifier.addListener(indexListener);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    widget.indexNotifier.removeListener(indexListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      toolbarHeight: lerpDouble(150.h, 50.h, widget.sizePercent)!,
      leading: const SizedBox.shrink(),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      elevation: 10 * widget.sizePercent,
      shadowColor: Colors.white60,
      pinned: true,
      actions: [
        Expanded(
          child: CustomTweenAnimation(
            child: PageView.builder(
              controller: controller,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (_, index) => Container(
                padding: 20.edgeInsetsH,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    stops: [0.6, 1],
                    colors: [
                      Colors.white,
                      Colors.white10,
                    ],
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Flexible(
                      child: FittedBox(
                        alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                        child: Text(
                          'ISSUE N',
                          style: context.titleSmall,
                        ),
                      ),
                    ),
                    Flexible(
                      flex: 10,
                      child: FittedBox(
                        alignment: Alignment(-1 * (1 - widget.sizePercent), 0),
                        child: Stack(
                          children: [
                            Text(
                              '${index < 9 ? '0' : ''}${index + 1}',
                              style:
                                  const TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Positioned.fill(
                              child: Transform.rotate(
                                angle: -pi * .1,
                                child: const Divider(
                                  color: Colors.black,
                                  thickness: .3,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
