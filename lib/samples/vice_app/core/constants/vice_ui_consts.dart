import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/theme/vice_colors.dart';

class ViceUIConsts {
  ViceUIConsts._();

  static const BoxDecoration gradientDecoration = BoxDecoration(
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0.3, 1],
      colors: ViceColors.scaffoldColors,
    ),
  );
}
