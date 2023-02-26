import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/shimmer_arrows.dart';
import 'package:ui_common/ui_common.dart';

class SmartRoomCard extends StatelessWidget {
  const SmartRoomCard(
      {Key? key, required this.percent, required this.smartRoom})
      : super(key: key);

  final double percent;
  final SmartRoom smartRoom;

  BoxDecoration get _roomCardDecoration {
    return BoxDecoration(
      borderRadius: borderRadiusA12,
      color: SHColors.hintColor,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 12,
          offset: Offset(-7, 7),
        ),
      ],
      image: DecorationImage(
        image: NetworkImage(smartRoom.imageUrl),
        fit: BoxFit.cover,
        colorFilter:
            const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
        alignment: Alignment(lerpDouble(.3, -.3, percent)!, 0),
      ),
    );
  }

  BoxDecoration get _vignetteDecoration => BoxDecoration(
        borderRadius: borderRadiusA12,
        gradient: const RadialGradient(
          radius: 2,
          colors: [Colors.transparent, Colors.black],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: _roomCardDecoration),
        DecoratedBox(decoration: _vignetteDecoration),
        _RoomTitle(title: smartRoom.name),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const ShimmerArrows(),
              spaceV24,
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
    );
  }
}

class _RoomTitle extends StatelessWidget {
  const _RoomTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        spaceV8,
        Flexible(
          child: Row(
            children: [
              FittedBox(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      title,
                      maxLines: 1,
                      style: context.displayMedium
                          .copyWith(color: SHColors.textColor),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(SHIcons.camera, color: SHColors.textColor),
                ),
              ),
              spaceV8,
            ],
          ),
        ),
        spaceV12,
      ],
    );
  }
}
