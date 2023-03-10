import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/parallax_image_box.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/shimmer_arrows.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/background_room_card.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/vertical_room_title.dart';
import 'package:ui_common/ui_common.dart';

class RoomCard extends StatelessWidget {
  const RoomCard({
    Key? key,
    required this.percent,
    required this.room,
    required this.expand,
    required this.onSwipeUp,
    required this.onSwipeDown,
    required this.onTap,
  }) : super(key: key);

  final double percent;
  final SmartRoom room;
  final VoidCallback onSwipeUp;
  final VoidCallback onSwipeDown;
  final VoidCallback onTap;
  final bool expand;

  @override
  Widget build(BuildContext context) {
    return TweenAnimationBuilder<double>(
      duration: kThemeAnimationDuration,
      curve: Curves.fastOutSlowIn,
      tween: Tween(begin: 0, end: expand ? 1 : 0),
      builder: (_, value, __) => Stack(
        children: [
          // -----------------------------------------------
          // Background information card
          // -----------------------------------------------
          Transform.scale(
            scale: lerpDouble(.85, 1.2, value)!,
            child: Padding(
              padding: EdgeInsets.only(bottom: 160.h),
              child: BackgroundRoomCard(room: room, translation: value),
            ),
          ),
          // -----------------------------------------------
          // Room image card with parallax effect
          // -----------------------------------------------
          Container(
            transform: Matrix4.translationValues(0, -80.h * value, 0),
            padding: EdgeInsets.only(bottom: 160.h),
            child: GestureDetector(
              onTap: onTap,
              onVerticalDragUpdate: (details) {
                if (details.primaryDelta! < -10) onSwipeUp();
                if (details.primaryDelta! > 10) onSwipeDown();
              },
              child: Hero(
                tag: room.id,
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ParallaxImageBox(
                      imageUrl: room.imageUrl,
                      factorChange: percent,
                    ),
                    VerticalRoomTitle(room: room),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const ShimmerArrows(),
                          height24,
                          Container(
                            margin: edgeInsetsB16,
                            height: 4.h,
                            width: 0.35.sw,
                            decoration: BoxDecoration(
                              color: SHColors.textColor,
                              borderRadius: borderRadiusA8,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
