import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/sh_divider.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

class RoomDetailBackCard extends StatelessWidget {
  const RoomDetailBackCard({
    super.key,
    required this.room,
    required this.translation,
  });

  final SmartRoom room;
  final double translation;

  @override
  Widget build(BuildContext context) {
    return Transform(
      transform: Matrix4.translationValues(0, 80.h * translation, 0),
      child: Container(
        margin: edgeInsetsB32,
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
                  _DeviceSwitcher(
                    onTap: () {},
                    icon: const Icon(SHIcons.lightBulb),
                    label: 'Lights',
                    isOn: room.lights.isOn,
                  ),
                  _DeviceSwitcher(
                    onTap: () {},
                    icon: const Icon(SHIcons.fan),
                    label: 'Air-conditioning',
                    isOn: room.airCondition.isOn,
                  ),
                  _DeviceSwitcher(
                    onTap: () {},
                    icon: const Icon(SHIcons.music),
                    label: 'Music',
                    isOn: room.musicInfo.isOn,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _DeviceSwitcher extends StatelessWidget {
  const _DeviceSwitcher({
    super.key,
    required this.onTap,
    required this.label,
    required this.icon,
    required this.isOn,
  });

  final String label;
  final Icon icon;
  final bool isOn;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final color = isOn ? SHColors.selectedColor : SHColors.textColor;
    return GestureDetector(
      onTap: () {
        print('entro');
      },
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
            isOn ? 'ON' : 'OFF',
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w700,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
