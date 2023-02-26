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
    return LightedBackground(
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
            spaceH12,
          ],
        ),
        body: SafeArea(
          child: Column(
            children: [
              spaceV24,
              Text('SELECT A ROOM', style: context.bodyLarge),
              spaceV32,
              Expanded(
                child: ValueListenableBuilder<double>(
                  valueListenable: pageNotifier,
                  builder: (_, value, __) => PageView.builder(
                    controller: controller,
                    physics: const BouncingScrollPhysics(),
                    itemCount: 5,
                    itemBuilder: (__, index) {
                      const urls = [
                        'https://cdn1.coppel.com/images/catalog/pm/4467263-1.jpg',
                        'https://media.houseandgarden.co.uk/photos/637637c2e4eb0449205a261c/4:3/w_2000,h_1500,c_limit/Shot-04_068_RT.jpg',
                        'https://mueblesvizcaya.com.mx/wp-content/uploads/2021/01/30KENES00-COMEDOR-KENA-P6.jpg',
                        'https://cdn.shopify.com/s/files/1/2217/4155/products/bali-3-amb_1400x.png?v=1661114773',
                        'https://m.media-amazon.com/images/I/715hLONUQOL._AC_SL1500_.jpg'
                      ];
                      return Padding(
                        padding: edgeInsetsH16.copyWith(bottom: 24.h),
                        child: RoomCard(
                          percent: (value - index),
                          imageUrl: urls[index],
                        ),
                      );
                    },
                  ),
                ),
              ),
              spaceV20,
              ValueListenableBuilder<double>(
                valueListenable: pageNotifier,
                builder: (_, value, __) =>
                    PageViewIndicators(length: 5, currentPercentIndex: value),
              ),
              spaceV32,
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
