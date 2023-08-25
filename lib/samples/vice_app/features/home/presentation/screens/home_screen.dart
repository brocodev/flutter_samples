import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:flutter_samples/samples/vice_app/features/home/presentation/widgets/all_editions_list_view.dart';
import 'package:flutter_samples/samples/vice_app/features/home/presentation/widgets/infinite_draggable_slider.dart';
import 'package:flutter_samples/samples/vice_app/features/magazines_details/presentation/screens/magazines_details_screen.dart';
import 'package:ui_common/ui_common.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
    this.enableEntryAnimation = false,
    this.initialIndex = 0,
  });

  final bool enableEntryAnimation;
  final int initialIndex;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late final AnimationController outAnimationController;
  late final AnimationController entryAnimationController;
  late final Animation<double> appBarAnimation;
  late final Animation<double> bodyAnimation;
  late final Animation<double> listAnimation;
  late final Animation<double> bottomBarAnimation;
  final List<Magazine> magazines = Magazine.fakeMagazinesValues;
  late int currentIndex;

  void openMagazineDetail(
    BuildContext context,
    int index,
  ) {
    outAnimationController.reverse();
    setState(() => currentIndex = index);
    MagazinesDetailsScreen.push(
      context,
      magazines: magazines,
      index: currentIndex,
    );
  }

  @override
  void initState() {
    currentIndex = widget.initialIndex;
    outAnimationController = AnimationController(
      vsync: this,
      duration: kThemeChangeDuration,
      value: 1,
    );
    entryAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
      value: widget.enableEntryAnimation ? 0 : 1,
    );
    appBarAnimation = CurvedAnimation(
      parent: entryAnimationController,
      curve: const Interval(0, .4, curve: Curves.fastOutSlowIn),
    );
    bodyAnimation = CurvedAnimation(
      parent: entryAnimationController,
      curve: const Interval(0, .6, curve: Curves.fastOutSlowIn),
    );
    listAnimation = CurvedAnimation(
      parent: entryAnimationController,
      curve: const Interval(0, .8, curve: Curves.fastOutSlowIn),
    );
    bottomBarAnimation = CurvedAnimation(
      parent: entryAnimationController,
      curve: const Interval(0, 1, curve: Curves.fastOutSlowIn),
    );
    if (widget.enableEntryAnimation) {
      Future.delayed(
        const Duration(milliseconds: 400),
        () => entryAnimationController.forward(),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    outAnimationController.dispose();
    entryAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ViceUIConsts.gradientDecoration,
      child: AnimatedBuilder(
        animation: entryAnimationController,
        builder: (context, child) {
          return AnimatedBuilder(
            animation: outAnimationController,
            builder: (_, child) {
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: _AppBar(
                  animation: outAnimationController,
                  entryAnimation: appBarAnimation,
                ),
                body: Column(
                  children: [
                    height12,
                    _OutTransition(
                      animation: appBarAnimation,
                      slideDown: true,
                      child: _OutTransition(
                        animation: outAnimationController,
                        child: Padding(
                          padding: 20.edgeInsetsH,
                          child: const TextField(
                            decoration: InputDecoration(
                              prefixIcon: Icon(ViceIcons.search),
                            ),
                          ),
                        ),
                      ),
                    ),
                    height20,
                    _OutTransition(
                      animation: bodyAnimation,
                      slideDown: true,
                      child: const Text(
                        'THE ARCHIVE',
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    height12,
                    Expanded(
                      child: _OutTransition(
                        animation: bodyAnimation,
                        slideDown: true,
                        child: Hero(
                          tag: magazines[currentIndex].id,
                          child: InfiniteDraggableSlider(
                            index: currentIndex,
                            itemCount: magazines.length,
                            shrinkAnimation: outAnimationController,
                            onTapItem: (index) =>
                                openMagazineDetail(context, index),
                            itemBuilder: (_, int index) =>
                                MagazineCoverImage(magazine: magazines[index]),
                          ),
                        ),
                      ),
                    ),
                    height52,
                    _OutTransition(
                      animation: listAnimation,
                      slideDown: true,
                      child: _OutTransition(
                        animation: outAnimationController,
                        slideDown: true,
                        child: SizedBox(
                          height: 120.h,
                          child: AllEditionsListView(magazines: magazines),
                        ),
                      ),
                    ),
                    height12,
                  ],
                ),
                bottomNavigationBar: _OutTransition(
                  animation: bottomBarAnimation,
                  slideDown: true,
                  child: _OutTransition(
                    animation: outAnimationController,
                    slideDown: true,
                    child: SafeArea(
                      child: SizedBox(
                        height: kToolbarHeight,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(ViceIcons.home)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(ViceIcons.settings)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(ViceIcons.share)),
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(ViceIcons.heart)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class _OutTransition extends StatelessWidget {
  const _OutTransition({
    required this.child,
    required this.animation,
    this.slideDown = false,
  });

  final Animation<double> animation;
  final bool slideDown;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: Offset(0, (slideDown ? 30 : -30) * (1 - animation.value)),
      child: FadeTransition(opacity: animation, child: child),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  const _AppBar({
    required this.animation,
    required this.entryAnimation,
  });

  final Animation<double> animation;
  final Animation<double> entryAnimation;

  @override
  Widget build(BuildContext context) {
    return _OutTransition(
      animation: entryAnimation,
      slideDown: true,
      child: AppBar(
        title: _OutTransition(
          animation: animation,
          child: Image.asset(
            'assets/img/vice/vice-logo.png',
            height: 30,
            color: Colors.white,
          ),
        ),
        actions: const [MenuButton()],
      ),
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
