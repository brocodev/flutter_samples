import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/smart_home/core/core.dart';
import 'package:ui_common/ui_common.dart';

class LightIntensitySliderCard extends StatelessWidget {
  const LightIntensitySliderCard({
    required this.room,
    super.key,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      childrenPadding: edgeInsetsA12,
      children: [
        _LightSwitcher(room: room),
        Row(
          children: [
            const Icon(SHIcons.lightMin),
            Expanded(
              child: Slider(
                value: .2,
                onChanged: (value) {},
              ),
            ),
            const Icon(SHIcons.lightMax),
          ],
        )
      ],
    );
  }
}

class _LightSwitcher extends StatelessWidget {
  const _LightSwitcher({
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text('Light intensity'),
          ),
        ),
        Flexible(
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(
              '${room.lights.value}%',
              style: TextStyle(fontSize: 20.sp),
            ),
          ),
        ),
        SHSwitcher(
          value: room.lights.isOn,
          onChanged: (value) {},
        ),
      ],
    );
  }
}
