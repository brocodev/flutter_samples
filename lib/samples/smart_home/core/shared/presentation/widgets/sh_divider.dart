import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/smart_home/core/theme/sh_colors.dart';

class SHDivider extends StatelessWidget {
  const SHDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 1,
      decoration: const BoxDecoration(
        color: SHColors.backgroundColor,
        boxShadow: [
          BoxShadow(
            blurRadius: 1,
            color: Colors.white54,
            offset: Offset(0, 1),
          )
        ],
      ),
    );
  }
}
