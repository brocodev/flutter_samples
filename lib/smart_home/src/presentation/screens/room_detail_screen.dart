import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/parallax_image_card.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/room_card.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({
    Key? key,
    required this.room,
    this.animationValue = 1,
  }) : super(key: key);

  final SmartRoom room;
  final double animationValue;

  @override
  Widget build(BuildContext context) {
    final outDx = 50 * animationValue;
    final outOpacity = 1 - animationValue;
    final sigma = 10 * animationValue;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Hero(
        tag: room.id,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ParallaxImageCard(imageUrl: room.imageUrl),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
                child: const ColoredBox(color: Colors.transparent),
              ),
            ),
            Transform(
              transform: Matrix4.translationValues(-outDx, 0, 0),
              child: Opacity(
                opacity: outOpacity,
                child: VerticalRoomTitle(room: room),
              ),
            ),
            Transform(
              transform:
                  Matrix4.translationValues(outDx, 100 * animationValue, 0),
              child: Opacity(
                opacity: outOpacity,
                child: const CameraIconButton(),
              ),
            ),
            Opacity(
              opacity: outOpacity,
              child: const AnimatedUpwardArrows(),
            ),
          ],
        ),
      ),
    );
  }
}
