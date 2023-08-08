import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/smart_home/core/core.dart';
import 'package:ui_common/ui_common.dart';

class LightsAndTimerSwitchers extends StatelessWidget {
  const LightsAndTimerSwitchers({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: 12.edgeInsetsA,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Lights'),
            height8,
            SHSwitcher(
              value: room.lights.isOn,
              onChanged: (value) {},
              icon: const Icon(SHIcons.lightBulbOutline),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Text('Timer'),
                Spacer(),
                BlueLightDot(),
              ],
            ),
            height8,
            SHSwitcher(
              icon: room.timer.isOn
                  ? const Icon(SHIcons.timer)
                  : const Icon(SHIcons.timerOff),
              value: room.timer.isOn,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
