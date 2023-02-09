import 'package:flutter/material.dart';
import 'package:flutter_samples/core/constants/icons.dart';
import 'package:flutter_samples/core/theme/colors.dart';
import 'package:ui_common/ui_common.dart';

var url =
    'https://bajio.dico.com.mx/media/catalog/product/cache/e5313a059d82e47a0dd0c73b13afb6be/s/a/sala-moderna-redwood-iii-gris-decorada-8.jpg';

class RoomCard extends StatelessWidget {
  const RoomCard({Key? key}) : super(key: key);

  BoxDecoration get _roomCardDecoration {
    return BoxDecoration(
      borderRadius: borderRadiusA12,
      color: SHColors.hintcolor,
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 12,
          offset: Offset(-7, 7),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: _roomCardDecoration,
          child: const _RoomTitle(),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              const _AnimatedArrows(),
              gap24,
              Container(
                margin: edgeInsetsB16,
                height: 6.h,
                width: 0.4.sw,
                decoration: BoxDecoration(
                  color: SHColors.textColor,
                  borderRadius: borderRadiusA8,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}

class _AnimatedArrows extends StatelessWidget {
  const _AnimatedArrows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) => const LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white,
          Colors.white10,
        ],
      ).createShader(rect),
      child: Column(
        children: const [
          Align(heightFactor: .4, child: Icon(SHIcons.arrow_up)),
          Align(heightFactor: .4, child: Icon(SHIcons.arrow_up)),
          Align(heightFactor: .4, child: Icon(SHIcons.arrow_up)),
        ],
      ),
    );
  }
}

class _RoomTitle extends StatelessWidget {
  const _RoomTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        gap8,
        Flexible(
          child: Row(
            children: [
              FittedBox(
                child: Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 24.w, vertical: 60.h),
                  child: RotatedBox(
                    quarterTurns: 3,
                    child: Text(
                      'LIVING ROOM',
                      maxLines: 1,
                      style:
                          context.headline2.copyWith(color: SHColors.textColor),
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Align(
                alignment: Alignment.topLeft,
                child: IconButton(
                  onPressed: () {},
                  icon: const Icon(SHIcons.camera, color: SHColors.textColor),
                ),
              ),
              space8,
            ],
          ),
        ),
        gap12,
      ],
    );
  }
}
