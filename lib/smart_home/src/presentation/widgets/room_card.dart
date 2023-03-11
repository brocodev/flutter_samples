import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/parallax_image_card.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/shimmer_arrows.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/screens/room_detail_screen.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/background_room_card.dart';
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
                // -----------------------------------------------
                // Custom hero widget
                // -----------------------------------------------
                flightShuttleBuilder: (_, animation, __, ___, ____) =>
                    AnimatedBuilder(
                  animation: animation,
                  builder: (__, _) => RoomDetailScreen(
                    room: room,
                    animationValue: animation.value,
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    ParallaxImageCard(
                      imageUrl: room.imageUrl,
                      parallaxValue: percent,
                    ),
                    VerticalRoomTitle(room: room),
                    const CameraIconButton(),
                    const AnimatedUpwardArrows()
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

class AnimatedUpwardArrows extends StatelessWidget {
  const AnimatedUpwardArrows({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
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
    );
  }
}

class CameraIconButton extends StatelessWidget {
  const CameraIconButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      type: MaterialType.transparency,
      child: Align(
        alignment: Alignment.topRight,
        child: IconButton(
          onPressed: () {},
          icon: const Icon(
            SHIcons.camera,
            color: SHColors.textColor,
          ),
        ),
      ),
    );
  }
}

class VerticalRoomTitle extends StatelessWidget {
  const VerticalRoomTitle({
    Key? key,
    required this.room,
  }) : super(key: key);
  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    // final dx = 50 * animationValue;
    // final opacity = 1 - animationValue;
    return Align(
      alignment: Alignment.centerLeft,
      child: RotatedBox(
        quarterTurns: -1,
        child: FittedBox(
          child: Padding(
            padding: EdgeInsets.only(left: 40.h, right: 20.h, top: 12.w),
            child: Text(
              room.name,
              maxLines: 1,
              style: context.displayLarge.copyWith(color: SHColors.textColor),
            ),
          ),
        ),
      ),
    );
  }
}
