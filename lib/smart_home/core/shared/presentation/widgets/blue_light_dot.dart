import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

class BlueLightDot extends StatelessWidget {
  const BlueLightDot({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: 8.sp,
      child: const DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.cyan,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.cyan,
              blurRadius: 10,
            )
          ],
        ),
      ),
    );
  }
}
