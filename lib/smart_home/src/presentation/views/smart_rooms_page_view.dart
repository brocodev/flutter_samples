import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/smart_room_card.dart';
import 'package:ui_common/ui_common.dart';

class SmartRoomsPageView extends StatelessWidget {
  const SmartRoomsPageView({
    super.key,
    required this.pageNotifier,
    required this.controller,
    required this.roomSelectorNotifier,
  });

  final ValueNotifier<double> pageNotifier;
  final ValueNotifier<int> roomSelectorNotifier;
  final PageController controller;

  double _getOffsetX(double percent) => percent.isNegative ? 30.0 : -30.0;

  Matrix4 _getOutTranslate(double percent, int selected, int index) {
    final x = selected != index && selected != -1 ? _getOffsetX(percent) : 0.0;
    return Matrix4.translationValues(x, 0, 0);
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<double>(
      valueListenable: pageNotifier,
      builder: (_, page, __) {
        return ValueListenableBuilder<int>(
          valueListenable: roomSelectorNotifier,
          builder: (_, selected, ___) {
            return PageView.builder(
              controller: controller,
              physics: selected != -1
                  ? const NeverScrollableScrollPhysics()
                  : const BouncingScrollPhysics(),
              clipBehavior: Clip.none,
              itemCount: SmartRoom.fakeValues.length,
              itemBuilder: (__, index) {
                final percent = (page - index);
                final isSelected = selected == index;
                return AnimatedContainer(
                  duration: kThemeAnimationDuration,
                  curve: Curves.fastOutSlowIn,
                  transform: _getOutTranslate(percent, selected, index),
                  padding: edgeInsetsH16,
                  child: SmartRoomCard(
                    percent: percent,
                    expand: isSelected,
                    smartRoom: SmartRoom.fakeValues[index],
                    onDragUp: () => roomSelectorNotifier.value = index,
                    onDragDown: () => roomSelectorNotifier.value = -1,
                  ),
                );
              },
            );
          },
        );
      },
    );
  }
}
