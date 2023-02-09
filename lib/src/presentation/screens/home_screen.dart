import 'package:flutter/material.dart';
import 'package:flutter_samples/core/constants/icons.dart';
import 'package:flutter_samples/src/presentation/widgets/linear_gradient_container.dart';
import 'package:flutter_samples/src/presentation/widgets/page_view_indicators.dart';
import 'package:flutter_samples/src/presentation/widgets/room_card.dart';
import 'package:ui_common/ui_common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final PageController controller = PageController(viewportFraction: .8);
  final ValueNotifier<double> pageNotifier = ValueNotifier(0);

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
    return LinearGradientContainer(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {},
            icon: const Icon(SHIcons.menu),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(SHIcons.search),
            ),
            space12,
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              gap24,
              Text('SELECT A ROOM', style: context.bodyText1),
              gap32,
              Expanded(
                child: PageView.builder(
                  controller: controller,
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: edgeInsetsH16.copyWith(bottom: 24.h),
                      child: const RoomCard(),
                    );
                  },
                ),
              ),
              gap20,
              ValueListenableBuilder<double>(
                valueListenable: pageNotifier,
                builder: (_, value, __) =>
                    PageViewIndicators(length: 5, currentPercentIndex: value),
              ),
              gap32,
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: edgeInsetsA20.copyWith(top: 0),
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
      ),
    );
  }
}
