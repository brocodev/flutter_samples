import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:flutter_samples/smart_home/core/shared/presentation/widgets/lighted_background..dart';
import 'package:flutter_samples/smart_home/src/domain/entities/smart_room.dart';
import 'package:flutter_samples/smart_home/src/presentation/views/smart_rooms_page_view.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/page_view_indicators.dart';
import 'package:flutter_samples/smart_home/src/presentation/widgets/sh_app_bar.dart';
import 'package:ui_common/ui_common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: .8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);
  final ValueNotifier<int> roomSelectorNotifier = ValueNotifier(-1);

  @override
  void initState() {
    controller.addListener(pageListener);
    super.initState();
  }

  @override
  void dispose() {
    controller
      ..removeListener(pageListener)
      ..dispose();
    super.dispose();
  }

  void pageListener() {
    pageNotifier.value = controller.page ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return LightedBackground(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: const SHAppBar(),
        body: SafeArea(
          child: Column(
            children: [
              height24,
              Text('SELECT A ROOM', style: context.bodyLarge),
              height32,
              Expanded(
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    SmartRoomsPageView(
                      pageNotifier: pageNotifier,
                      roomSelectorNotifier: roomSelectorNotifier,
                      controller: controller,
                    ),
                    Positioned.fill(
                      top: null,
                      child: Column(
                        children: [
                          _PageIndicators(
                            roomSelectorNotifier: roomSelectorNotifier,
                            pageNotifier: pageNotifier,
                          ),
                          _BottomNavigationBar(
                            roomSelectorNotifier: roomSelectorNotifier,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PageIndicators extends StatelessWidget {
  const _PageIndicators({
    super.key,
    required this.roomSelectorNotifier,
    required this.pageNotifier,
  });

  final ValueNotifier<int> roomSelectorNotifier;
  final ValueNotifier<double> pageNotifier;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<int>(
      valueListenable: roomSelectorNotifier,
      builder: (_, value, child) => AnimatedOpacity(
        opacity: value != -1 ? 0 : 1,
        duration: value != -1
            ? const Duration(milliseconds: 1)
            : const Duration(milliseconds: 400),
        child: child,
      ),
      child: ValueListenableBuilder<double>(
        valueListenable: pageNotifier,
        builder: (_, value, __) => Center(
          child: PageViewIndicators(
            length: SmartRoom.fakeValues.length,
            pageIndex: value,
          ),
        ),
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    super.key,
    required this.roomSelectorNotifier,
  });

  final ValueNotifier<int> roomSelectorNotifier;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: edgeInsetsA20,
      child: ValueListenableBuilder<int>(
        valueListenable: roomSelectorNotifier,
        builder: (_, value, child) => AnimatedOpacity(
          duration: kThemeAnimationDuration,
          opacity: value != -1 ? 0 : 1,
          child: AnimatedContainer(
            duration: kThemeAnimationDuration,
            transform:
                Matrix4.translationValues(0, value != -1 ? -30.0 : 0.0, 0),
            child: child,
          ),
        ),
        child: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: edgeInsetsA8,
                child: const Icon(SHIcons.lock),
              ),
              label: 'UNLOCK',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: edgeInsetsA8,
                child: const Icon(SHIcons.home),
              ),
              label: 'MAIN',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: edgeInsetsA8,
                child: const Icon(SHIcons.settings),
              ),
              label: 'SETTINGS',
            ),
          ],
        ),
      ),
    );
  }
}
