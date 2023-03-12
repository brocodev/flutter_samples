import 'dart:io';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/parallax_image_card.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/room_card.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/sh_app_bar.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SHAppBar(),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          if (!Platform.isIOS) return;
          if (details.primaryDelta! > 10 && details.globalPosition.dx < 100) {
            Navigator.pop(context);
          }
        },
        child: RoomDetailItems(
          // animationValue: 0,
          room: room,
        ),
      ),
    );
  }
}

class RoomDetailItems extends StatelessWidget {
  const RoomDetailItems({
    super.key,
    this.animationValue = 1,
    required this.room,
  });

  final double animationValue;
  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    final outDx = 50 * animationValue;
    final outOpacity = 1 - animationValue;
    final sigma = 10 * animationValue;
    return Hero(
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
                Matrix4.translationValues(outDx, 50 * (animationValue * 2), 0),
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
    );
  }
}
