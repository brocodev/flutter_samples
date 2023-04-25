import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/theme/sh_colors.dart';
import 'package:ui_common/ui_common.dart';

class SHSwitch extends StatelessWidget {
  const SHSwitch({
    super.key,
    required this.value,
    required this.onChanged,
    required this.icon,
  });

  final bool value;
  final Icon icon;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        children: [
          IconTheme(
            data: IconThemeData(
              color: value ? SHColors.selectedColor : Colors.white38,
            ),
            child: icon,
          ),
          width4,
          CupertinoSwitch(
            trackColor: SHColors.trackColor,
            activeColor: SHColors.trackColor,
            thumbColor: value ? null : Colors.white60,
            value: value,
            onChanged: onChanged,
          ),
          width4,
          Text(
            value ? 'ON' : 'OFF',
            style: TextStyle(
              fontSize: 16.sp,
              fontWeight: FontWeight.w900,
              color: value ? SHColors.selectedColor : Colors.white38,
            ),
          )
        ],
      ),
    );
  }
}
