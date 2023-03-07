import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/sh_divider.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

class RoomDetailsBackCard extends StatelessWidget {
  const RoomDetailsBackCard({
    super.key,
    required this.room,
    required this.translation,
  });

  final SmartRoom room;
  final double translation;

  @override
  Widget build(BuildContext context) {
    return Container(
      transform: Matrix4.translationValues(0, 80.h * translation, 0),
      decoration: BoxDecoration(
        color: SHColors.cardColor,
        borderRadius: borderRadiusA12,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(-7, 7),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const SHDivider(),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.lightBulb),
                  label: 'Lights',
                  value: room.lights.isOn,
                ),
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.fan),
                  label: 'Air-conditioning',
                  value: room.airCondition.isOn,
                ),
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.music),
                  label: 'Music',
                  value: room.musicInfo.isOn,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _DeviceIconSwitcher extends StatelessWidget {
  const _DeviceIconSwitcher({
    required this.onTap,
    required this.label,
    required this.icon,
    required this.value,
  });

  final String label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final color = value ? SHColors.selectedColor : SHColors.textColor;
    return InkWell(
      onTap: () => onTap(!value),
      child: Container(
        color: Colors.amber,
        child: Column(
          children: [
            IconTheme(
              data: IconThemeData(color: color, size: 28.sp),
              child: icon,
            ),
            height4,
            Text(
              label,
              style: context.bodySmall.copyWith(fontSize: 10.sp, color: color),
            ),
            Text(
              value ? 'ON' : 'OFF',
              style: GoogleFonts.montserrat(
                fontWeight: FontWeight.w700,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
