import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/parallax_image_card.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/room_card.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/sh_app_bar.dart';
import 'package:ui_common/ui_common.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const SHAppBar(),
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.primaryDelta! > 30) {
            Navigator.pop(context);
          }
        },
        child: RoomDetailItems(
          topPadding: context.mediaQuery.padding.top,
          room: room,
        ),
      ),
    );
  }
}

class RoomDetailItems extends StatelessWidget {
  const RoomDetailItems({
    super.key,
    this.animation = const AlwaysStoppedAnimation<double>(1),
    required this.room,
    required this.topPadding,
  });

  final Animation<double> animation;
  final double topPadding;
  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    final outDx = 200 * animation.value;
    final outDy = 100 * animation.value;
    final sigma = 10 * animation.value;
    return Hero(
      tag: room.id,
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand,
        children: [
          ParallaxImageCard(imageUrl: room.imageUrl),
          ClipRRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaY: sigma, sigmaX: sigma),
              child: const ColoredBox(color: Colors.transparent),
            ),
          ),
          // --------------------------------------------
          // Hided animated elements
          // --------------------------------------------
          Opacity(
            opacity: 1 - animation.value,
            child: Stack(
              children: [
                Transform.translate(
                  offset: Offset(-outDx, 0),
                  child: VerticalRoomTitle(room: room),
                ),
                Transform.translate(
                  offset: Offset(outDx, outDy),
                  child: const CameraIconButton(),
                ),
                Transform.translate(
                  offset: Offset(0, outDy),
                  child: const AnimatedUpwardArrows(),
                ),
              ],
            ),
          ),
          // --------------------------------------------
          // Room details animated elements
          // --------------------------------------------
          Opacity(
            opacity: animation.value,
            child: Container(
              transform:
                  Matrix4.translationValues(0, -200 * (1 - animation.value), 0),
              padding: EdgeInsets.only(top: topPadding + 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    room.name.replaceAll(' ', '\n'),
                    textAlign: TextAlign.center,
                    style: context.displaySmall.copyWith(height: .9),
                  ),
                  const Text('SETTINGS', textAlign: TextAlign.center),
                  height8,
                  Transform.translate(
                    offset: Offset(
                      lerpDouble(-100, 20, animation.value)!,
                      100 * (1 - animation.value),
                    ),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton.icon(
                        onPressed: () => Navigator.pop(context),
                        style: TextButton.styleFrom(
                            alignment: Alignment.centerLeft),
                        icon: const Icon(Icons.keyboard_arrow_left),
                        label: const Text('BACK'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
