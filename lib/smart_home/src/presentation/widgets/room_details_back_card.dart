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
          const _RoomInfoRow(
            icon: Icon(Icons.device_thermostat),
            label: Text('Temperature'),
            data: Text('22°'),
          ),
          height4,
          const _RoomInfoRow(
            icon: Icon(Icons.water_drop_outlined),
            label: Text('Air Humidity'),
            data: Text('48%'),
          ),
          height4,
          const _RoomInfoRow(
            icon: Icon(Icons.timer_outlined),
            label: Text('Timer'),
            data: null,
          ),
          height12,
          const SHDivider(),
          Padding(
            padding: EdgeInsets.all(12.sp),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.lightBulb),
                  label: const Text('Lights'),
                  value: room.lights.isOn,
                ),
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.fan),
                  label: const Text('Air-conditioning'),
                  value: room.airCondition.isOn,
                ),
                _DeviceIconSwitcher(
                  onTap: (value) {},
                  icon: const Icon(SHIcons.music),
                  label: const Text('Music'),
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

  final Text label;
  final Icon icon;
  final bool value;
  final ValueChanged<bool> onTap;

  @override
  Widget build(BuildContext context) {
    final color = value ? SHColors.selectedColor : SHColors.textColor;
    return InkWell(
      onTap: () => onTap(!value),
      child: Column(
        children: [
          IconTheme(
            data: IconThemeData(color: color, size: 24.sp),
            child: icon,
          ),
          height4,
          DefaultTextStyle(
            style: context.bodySmall.copyWith(color: color),
            child: label,
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
    );
  }
}

class _RoomInfoRow extends StatelessWidget {
  const _RoomInfoRow({
    required this.icon,
    required this.label,
    required this.data,
  });

  final Icon icon;
  final Text label;
  final Text? data;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        width32,
        IconTheme(
          data: context.iconTheme.copyWith(size: 18.sp),
          child: icon,
        ),
        width4,
        Expanded(
          child: DefaultTextStyle(
            style: context.bodySmall.copyWith(
              color: data == null ? context.textColor.withOpacity(.6) : null,
            ),
            child: label,
          ),
        ),
        DefaultTextStyle(
          style: GoogleFonts.montserrat(
            fontSize: 14.sp,
            fontWeight: FontWeight.w700,
          ),
          child: data ??
              Row(
                children: [
                  SizedBox.square(
                    dimension: 8.sp,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: Colors.cyan,
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.cyan.withOpacity(.6),
                            blurRadius: 5,
                          )
                        ],
                      ),
                    ),
                  ),
                  width4,
                  Text(
                    'OFF',
                    style: TextStyle(
                      fontSize: 12.sp,
                      color: SHColors.textColor.withOpacity(.6),
                    ),
                  ),
                ],
              ),
        ),
        width32,
      ],
    );
  }
}
