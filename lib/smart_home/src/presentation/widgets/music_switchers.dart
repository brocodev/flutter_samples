import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/sh_card.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/sh_switch.dart';
import 'package:flutter_samples/smart_home/core/theme/sh_colors.dart';
import 'package:flutter_samples/smart_home/core/theme/sh_icons.dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

class MusicSwitchers extends StatelessWidget {
  const MusicSwitchers({
    super.key,
    required this.room,
  });

  final SmartRoom room;

  @override
  Widget build(BuildContext context) {
    return SHCard(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height4,
            Row(
              children: const [
                Text('Music'),
                Spacer(),
                Icon(Icons.open_in_new_rounded),
              ],
            ),
            height8,
            SHSwitch(
              value: room.musicInfo.isOn,
              icon: const Icon(SHIcons.music),
              onChanged: (value) {},
            ),
            height16,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height12,
            Text(
              room.musicInfo.currentSong.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            height4,
            Text(
              room.musicInfo.currentSong.artist,
              style: GoogleFonts.montserrat(
                color: SHColors.selectedColor,
                fontWeight: FontWeight.w500,
                fontSize: 12,
              ),
            ),
            IconTheme(
              data: IconThemeData(size: 28.sp, color: Colors.white),
              child: FittedBox(
                alignment: Alignment.center,
                fit: BoxFit.scaleDown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.fast_rewind),
                    width8,
                    room.musicInfo.isOn
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                    width8,
                    const Icon(Icons.fast_forward),
                  ],
                ),
              ),
            ),
            height4,
          ],
        ),
      ],
    );
  }
}
