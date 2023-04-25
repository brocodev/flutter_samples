import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/sh_card.dart';
import 'package:ui_common/ui_common.dart';

class RoomDetailsPageView extends StatelessWidget {
  const RoomDetailsPageView({
    super.key,
    required this.animation,
  });

  final Animation<double> animation;

  Animation<double> get _interval1 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      );

  Animation<double> get _interval2 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      );

  Animation<double> get _interval3 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      );

  @override
  Widget build(BuildContext context) {
    final animation2 = CurvedAnimation(
      parent: animation,
      curve: Curves.easeInQuad,
    );
    return PageView(
      children: [
        Column(
          children: [
            Transform.translate(
              offset: Offset(
                lerpDouble(-100, 10, animation2.value)!,
                100 * (1 - animation2.value),
              ),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                  icon: const Icon(Icons.keyboard_arrow_left),
                  label: const Text('BACK'),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: edgeInsetsA20.copyWith(top: 0),
                children: [
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval1),
                    child: FadeTransition(
                      opacity: _interval1,
                      child: Row(
                        children: [
                          Expanded(
                            child: SHCard(),
                          ),
                          width20,
                          Expanded(
                            child: Container(
                              height: 180,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  height20,
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval2),
                    child: FadeTransition(
                      opacity: _interval2,
                      child: Container(
                        height: 180,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  height20,
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval1),
                    child: FadeTransition(
                      opacity: _interval3,
                      child: Container(
                        height: 180,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
