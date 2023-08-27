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
  final List<Magazine> magazines = Magazine.fakeMagazinesValues;
  late int currentIndex;
  List<Animation<double>> entryAnimations =
      List.filled(4, const AlwaysStoppedAnimation(1));

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
      value: 0,
    );
    if (widget.enableEntryAnimation) {
      entryAnimations = List.generate(
        4,
        (index) => CurvedAnimation(
          parent: entryAnimationController,
          curve: Interval(0, .2 * (index + 1), curve: Curves.fastOutSlowIn),
        ),
      );
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
  Widget build(BuildContext context) {
    return Container(
      decoration: ViceUIConsts.gradientDecoration,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: _AppBar(
          outAnimation: outAnimationController,
          entryAnimation: entryAnimations[0],
        ),
        body: Column(
          children: [
            height12,
            _EntryOutTransition(
              entryAnimation: entryAnimations[0],
              outAnimation: outAnimationController,
              entryBeginOffset: const Offset(0, 1),
              outBeginOffset: const Offset(0, -1),
              child: Padding(
                padding: 20.edgeInsetsH,
                child: const TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(ViceIcons.search),
                  ),
                ),
              ),
            ),
            height20,
            _EntryOutTransition(
              entryAnimation: entryAnimations[0],
              entryBeginOffset: const Offset(0, 3),
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
              child: _EntryOutTransition(
                entryAnimation: entryAnimations[1],
                entryBeginOffset: const Offset(0, .2),
                child: Hero(
                  tag: magazines[currentIndex].id,
                  child: InfiniteDraggableSlider(
                    index: currentIndex,
                    itemCount: magazines.length,
                    shrinkAnimation: outAnimationController,
                    onTapItem: (index) => openMagazineDetail(context, index),
                    itemBuilder: (_, int index) =>
                        MagazineCoverImage(magazine: magazines[index]),
                  ),
                ),
              ),
            ),
            height52,
            _EntryOutTransition(
              entryAnimation: entryAnimations[2],
              outAnimation: outAnimationController,
              entryBeginOffset: const Offset(0, .5),
              outBeginOffset: const Offset(0, .5),
              child: SizedBox(
                height: 120.h,
                child: AllEditionsListView(magazines: magazines),
              ),
            ),
            height12,
          ],
        ),
        bottomNavigationBar: _EntryOutTransition(
          entryAnimation: entryAnimations[3],
          outAnimation: outAnimationController,
          entryBeginOffset: const Offset(0, .8),
          outBeginOffset: const Offset(0, .8),
          child: SafeArea(
            child: SizedBox(
              height: kToolbarHeight,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(ViceIcons.home),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(ViceIcons.settings),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(ViceIcons.share),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(ViceIcons.heart),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _EntryOutTransition extends StatelessWidget {
  const _EntryOutTransition({
    required this.child,
    required this.entryAnimation,
    this.outAnimation = const AlwaysStoppedAnimation(1),
    this.entryBeginOffset = Offset.zero,
    this.outBeginOffset = Offset.zero,
  });

  final Animation<double> entryAnimation;
  final Animation<double> outAnimation;
  final Offset entryBeginOffset;
  final Offset outBeginOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SlideTransition(
      position:
          Tween(begin: outBeginOffset, end: Offset.zero).animate(outAnimation),
      child: FadeTransition(
        opacity: outAnimation,
        child: SlideTransition(
          position: Tween(begin: entryBeginOffset, end: Offset.zero)
              .animate(entryAnimation),
          child: FadeTransition(opacity: entryAnimation, child: child),
        ),
      ),
    );
  }
}

class _AppBar extends StatelessWidget implements PreferredSize {
  const _AppBar({
    required this.outAnimation,
    required this.entryAnimation,
  });

  final Animation<double> outAnimation;
  final Animation<double> entryAnimation;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      clipBehavior: Clip.none,
      title: _EntryOutTransition(
        entryAnimation: entryAnimation,
        outAnimation: outAnimation,
        entryBeginOffset: const Offset(0, 2),
        outBeginOffset: const Offset(0, -1),
        child: Image.asset(
          'assets/img/vice/vice-logo.png',
          height: 30,
          color: Colors.white,
        ),
      ),
      actions: [
        FadeTransition(
          opacity: entryAnimation,
          child: const MenuButton(),
        ),
      ],
    );
  }

  @override
  Widget get child => this;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
