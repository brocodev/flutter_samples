import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/smart_room_card.dart';
import 'package:ui_common/ui_common.dart';

class SmartRoomsPageView extends StatelessWidget {
  const SmartRoomsPageView({
    super.key,
    required this.pageNotifier,
    required this.controller,
    required this.outAnimationNotifier,
  });

  final ValueNotifier<double> pageNotifier;
  final ValueNotifier<bool> outAnimationNotifier;
  final PageController controller;

  double _getOffsetX(double percent) => percent.isNegative ? 30.0 : -30.0;

  Matrix4 _getOutTranslate(double percent, bool enable) {
    final x = percent != 0 && enable ? _getOffsetX(percent) : 0.0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageNotifier,
      builder: (_, page, __) {
        return PageView.builder(
          controller: controller,
          physics: const BouncingScrollPhysics(),
          itemCount: SmartRoom.fakeValues.length,
          itemBuilder: (__, index) {
            final percent = (page - index);
            return GestureDetector(
              onTap: () =>
                  outAnimationNotifier.value = !outAnimationNotifier.value,
              child: ValueListenableBuilder<bool>(
                valueListenable: outAnimationNotifier,
                builder: (_, enable, ___) {
                  return AnimatedContainer(
                    duration: kThemeAnimationDuration,
                    transform: _getOutTranslate(percent, enable),
                    padding: edgeInsetsH16.copyWith(bottom: 24.h),
                    child: SmartRoomCard(
                      percent: percent,
                      smartRoom: SmartRoom.fakeValues[index],
                    ),
                  );
                },
              ),
            );
          },
        );
      },
    );
  }
}
