import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:ui_common/ui_common.dart';

class ParallaxImageCard extends StatelessWidget {
  const ParallaxImageCard({
    super.key,
    required this.imageUrl,
    this.parallaxValue = 0,
  });

  final String imageUrl;
  final double parallaxValue;

  // -----------------------------------------------
  // Decoration for image and parallax effect
  // -----------------------------------------------
  BoxDecoration get _parallaxUrlImageDecoration => BoxDecoration(
        borderRadius: borderRadiusA12,
        color: SHColors.hintColor,
        boxShadow: const [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 12,
            offset: Offset(-7, 7),
          ),
        ],
        image: DecorationImage(
          image: CachedNetworkImageProvider(imageUrl),
          fit: BoxFit.cover,
          colorFilter:
              const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
          alignment: Alignment(lerpDouble(.5, -.5, parallaxValue)!, 0),
        ),
      );

  // -----------------------------------------------
  // Radial vignette effect decoration
  // -----------------------------------------------
  BoxDecoration get _vignetteDecoration => BoxDecoration(
        borderRadius: borderRadiusA12,
        gradient: const RadialGradient(
          radius: 2,
          colors: [Colors.transparent, Colors.black],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        DecoratedBox(decoration: _parallaxUrlImageDecoration),
        DecoratedBox(decoration: _vignetteDecoration),
      ],
    );
  }
}
