import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/core.dart';
import 'package:flutter_samples/smart_home/src/domain/domain.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_common/ui_common.dart';

class RoomDetailsPageView extends StatelessWidget {
  const RoomDetailsPageView({
    super.key,
    required this.animation,
    required this.room,
  });

  final Animation<double> animation;
  final SmartRoom room;

  Animation<double> get _interval1 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.4, 1.0, curve: Curves.easeIn),
      );

  Animation<double> get _interval2 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.5, 1.0, curve: Curves.easeIn),
      );

  Animation<double> get _interval3 => CurvedAnimation(
        parent: animation,
        curve: const Interval(0.6, 1.0, curve: Curves.easeIn),
      );

  @override
  Widget build(BuildContext context) {
    return PageView(
      children: [
        Column(
          children: [
            SlideTransition(
              position: Tween(
                begin: const Offset(-1, 1),
                end: Offset.zero,
              ).animate(animation),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TextButton.icon(
                  onPressed: () => Navigator.pop(context),
                  style: TextButton.styleFrom(alignment: Alignment.centerLeft),
                  icon: const Icon(Icons.keyboard_arrow_left),
                  label: const Text('BACK'),
                ),
              ),
            ),
            Expanded(
              child: ListView(
                padding: edgeInsetsA20.copyWith(top: 0),
                children: [
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval1),
                    child: FadeTransition(
                      opacity: _interval1,
                      child: DefaultTextStyle(
                        style: GoogleFonts.montserrat(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w700,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: LightsAndTimerCard(room: room),
                            ),
                            width20,
                            Expanded(
                              child: SHCard(
                                height: 180,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  height20,
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval2),
                    child: FadeTransition(
                      opacity: _interval2,
                      child: SHCard(
                        height: 180,
                      ),
                    ),
                  ),
                  height20,
                  SlideTransition(
                    position: Tween(
                      begin: const Offset(0, 2),
                      end: Offset.zero,
                    ).animate(_interval1),
                    child: FadeTransition(
                      opacity: _interval3,
                      child: SHCard(
                        height: 180,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class LightsAndTimerCard extends StatelessWidget {
  const LightsAndTimerCard({
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
            const Text('Lights'),
            height8,
            SHSwitch(
              value: room.lights.isOn,
              onChanged: (value) {},
              icon: const Icon(SHIcons.lightBulbOutline),
            ),
            height8,
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            height8,
            const Text('Timer'),
            height8,
            SHSwitch(
              icon: const Icon(SHIcons.timerOff),
              value: false,
              onChanged: (value) {},
            ),
          ],
        ),
      ],
    );
  }
}
