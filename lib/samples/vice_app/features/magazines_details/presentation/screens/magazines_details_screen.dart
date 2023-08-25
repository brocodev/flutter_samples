import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:flutter_samples/samples/vice_app/features/magazines_details/presentation/screens/back_to_home_screen.dart';
import 'package:flutter_samples/samples/vice_app/features/magazines_details/presentation/widgets/content_magazines_page_view.dart';
import 'package:flutter_samples/samples/vice_app/features/magazines_details/presentation/widgets/widgets.dart';
import 'package:ui_common/ui_common.dart';

class MagazinesDetailsScreen extends StatefulWidget {
  const MagazinesDetailsScreen({
    required this.index,
    required this.magazines,
    super.key,
  });

  final int index;
  final List<Magazine> magazines;

  static void push(
    BuildContext context, {
    required int index,
    required List<Magazine> magazines,
  }) =>
      Navigator.push<int>(
        context,
        PageRouteBuilder(
          pageBuilder: (_, animation, __) => FadeTransition(
            opacity: animation,
            child: MagazinesDetailsScreen(
              index: index,
              magazines: magazines,
            ),
          ),
        ),
      );

  @override
  State<MagazinesDetailsScreen> createState() => _MagazinesDetailsScreenState();
}

class _MagazinesDetailsScreenState extends State<MagazinesDetailsScreen> {
  late final ScrollController scrollController;
  late ValueNotifier<int> indexNotifier;
  double headerPercent = 0.0;

  void scrollListener() {
    headerPercent = (scrollController.offset / .65.sh).clamp(0, 1);
    if (headerPercent < 1) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
      );
    }
    setState(() {});
  }

  void backToHome(BuildContext context) {
    scrollController.animateTo(
      1.sh,
      duration: const Duration(milliseconds: 800),
      curve: Curves.decelerate,
    );
    BackToHomeScreen.push(context, indexNotifier.value);
  }

  @override
  void initState() {
    scrollController = ScrollController()..addListener(scrollListener);
    indexNotifier = ValueNotifier(widget.index);
    super.initState();
  }

  @override
  void dispose() {
    scrollController
      ..removeListener(scrollListener)
      ..dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        backToHome(context);
        return false;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Stack(
          children: [
            CustomScrollView(
              physics: const BouncingScrollPhysics(),
              controller: scrollController,
              slivers: [
                SliverPersistentHeader(
                  delegate: BuilderPersistentDelegate(
                    minExtent: 0,
                    maxExtent: .65.sh,
                    builder: (percent) => Stack(
                      children: [
                        MagazinesCube3DPageView(
                          sizePercent: percent,
                          initialIndex: indexNotifier.value,
                          onPageChanged: (value) => indexNotifier.value = value,
                          magazines: widget.magazines,
                        ),
                        RectanglePageViewIndicators(
                          percent: percent,
                          indexNotifier: indexNotifier,
                          length: widget.magazines.length,
                        )
                      ],
                    ),
                  ),
                ),
                StickySliverAppBar(
                  sizePercent: headerPercent,
                  indexNotifier: indexNotifier,
                ),
                SliverToBoxAdapter(
                  child: ContentMagazinesPageView(
                    indexNotifier: indexNotifier,
                    magazines: widget.magazines,
                  ),
                ),
              ],
            ),
            HeartAndSaveButtons(movePercent: headerPercent),
            SafeArea(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    color:
                        Color.lerp(Colors.white60, Colors.black, headerPercent),
                    onPressed: () => backToHome(context),
                    icon: const Icon(ViceIcons.close),
                  ),
                  MenuButton(
                    color: Color.lerp(
                        Colors.white60, Colors.black, headerPercent)!,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
