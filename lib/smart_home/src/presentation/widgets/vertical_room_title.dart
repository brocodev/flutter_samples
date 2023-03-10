import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:ui_common/ui_common.dart';

class VerticalRoomTitle extends StatelessWidget {
  const VerticalRoomTitle({
    Key? key,
    required this.room,
  }) : super(key: key);
  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        width8,
        Flexible(
          child: Row(
            children: [
              RotatedBox(
                quarterTurns: -1,
                child: FittedBox(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: 40.h, right: 20.h, top: 12.w),
                    child: Text(
                      room.name,
                      maxLines: 1,
                      style: context.displayLarge
                          .copyWith(color: SHColors.textColor),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Material(
                type: MaterialType.transparency,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    onPressed: () {},
                    icon: const Icon(SHIcons.camera, color: SHColors.textColor),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
