import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/core.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

class AirConditionerControlsCard extends StatelessWidget {
  const AirConditionerControlsCard({
    super.key,
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: edgeInsetsA12,
      children: [
        _AirSwitcher(room: room),
        const _AirIcons(),
        Column(
          children: [
            Row(
              children: [
                Container(
                  width: 120.w,
                  height: 50.h,
                  margin: edgeInsetsA8,
                  decoration: BoxDecoration(
                    borderRadius: borderRadiusA12,
                    border: Border.all(
                      width: 10,
                      color: Colors.white38,
                    ),
                  ),
                ),
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.scaleDown,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        const Icon(
                          SHIcons.waterDrop,
                          color: Colors.white38,
                          size: 20,
                        ),
                        Text(
                          'Air humidity',
                          style: GoogleFonts.montserrat(
                            fontSize: 10.sp,
                            color: Colors.white60,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        width8,
                        Text('${room.airHumidity.toInt()}%'),
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        )
      ],
    );
  }
}

class _AirIcons extends StatelessWidget {
  const _AirIcons();

  @override
  Widget build(BuildContext context) {
    return IconTheme(
      data: IconThemeData(size: 30.sp, color: Colors.white38),
      child: Row(
        children: const [
          Icon(SHIcons.snowFlake),
          width8,
          Icon(SHIcons.wind),
          width8,
          Icon(SHIcons.waterDrop),
          width8,
          Icon(SHIcons.timer, color: SHColors.selectedColor),
        ],
      ),
    );
  }
}

class _AirSwitcher extends StatelessWidget {
  const _AirSwitcher({
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Air conditioning'),
        height12,
        Row(
          children: [
            Expanded(
              child: SHSwitcher(
                icon: const Icon(SHIcons.fan),
                value: room.airCondition.isOn,
                onChanged: (value) {},
              ),
            ),
            const Spacer(),
            Text(
              '${room.airCondition.value}˚',
              style: TextStyle(fontSize: 28.sp),
            )
          ],
        )
      ],
    );
  }
}
