import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/core.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:ui_common/ui_common.dart';

class LightsAndTimerSwitchers extends StatelessWidget {
  const LightsAndTimerSwitchers({
    super.key,
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height4,
            const Text('Lights'),
            height8,
            SHSwitch(
              value: room.lights.isOn,
              onChanged: (value) {},
              icon: const Icon(SHIcons.lightBulbOutline),
            ),
            height16,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height16,
            Row(
              children: const [
                Text('Timer'),
                Spacer(),
                BlueLightDot(),
              ],
            ),
            height8,
            SHSwitch(
              icon: const Icon(SHIcons.timerOff),
              value: false,
              onChanged: (value) {},
            ),
            height4,
          ],
        ),
      ],
    );
  }
}
