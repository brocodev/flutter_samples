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
      childrenPadding: edgeInsetsA12,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Text('Music'),
                Spacer(),
                Icon(Icons.open_in_new_rounded),
              ],
            ),
            height8,
            SHSwitcher(
              value: room.musicInfo.isOn,
              icon: const Icon(SHIcons.music),
              onChanged: (value) {},
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
              data: IconThemeData(size: 20.sp, color: Colors.white),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Flexible(child: Icon(Icons.fast_rewind)),
                  width8,
                  Flexible(
                    child: room.musicInfo.isOn
                        ? const Icon(Icons.pause)
                        : const Icon(Icons.play_arrow),
                  ),
                  width8,
                  const Flexible(child: Icon(Icons.fast_forward)),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
