import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/shared/domain/entities/magazine.dart';

class MagazineCoverImage extends StatelessWidget {
  const MagazineCoverImage({
    required this.magazine,
    super.key,
    this.height,
  });

  final Magazine magazine;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: AspectRatio(
        aspectRatio: .75,
        child: DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(magazine.assetImage),
              fit: BoxFit.cover,
            ),
            boxShadow: const [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 40,
                offset: Offset(-20, 20),
              )
            ],
          ),
        ),
      ),
    );
  }
}
