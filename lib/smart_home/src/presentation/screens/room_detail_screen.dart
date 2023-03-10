import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/prensentation/widgets/parallax_image_box.dart';
import 'package:flutter_samples/smart_home/core/theme/colors.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';

class RoomDetailScreen extends StatelessWidget {
  const RoomDetailScreen({Key? key, required this.room}) : super(key: key);

  final SmartRoom room;

  // -----------------------------------------------
  // Decoration for image and parallax effect
  // -----------------------------------------------
  BoxDecoration get _roomCardDecoration {
    return BoxDecoration(
      color: SHColors.hintColor,
      boxShadow: const [
        BoxShadow(
          color: Colors.black26,
          blurRadius: 12,
          offset: Offset(-7, 7),
        ),
      ],
      image: DecorationImage(
        image: CachedNetworkImageProvider(room.imageUrl),
        fit: BoxFit.cover,
        colorFilter:
            const ColorFilter.mode(Colors.black26, BlendMode.colorBurn),
        alignment: const Alignment(.5, 0),
      ),
    );
  }

  BoxDecoration get _vignetteDecoration => const BoxDecoration(
        gradient: RadialGradient(
          radius: 2,
          colors: [Colors.transparent, Colors.black],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Hero(
        tag: room.id,
        child: Stack(
          fit: StackFit.expand,
          children: [
            ParallaxImageBox(imageUrl: room.imageUrl),
          ],
        ),
      ),
    );
  }
}
