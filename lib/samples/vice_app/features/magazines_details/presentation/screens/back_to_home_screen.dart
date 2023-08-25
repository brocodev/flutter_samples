import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/samples/vice_app/features/home/presentation/screens/home_screen.dart';

class BackToHomeScreen extends StatefulWidget {
  const BackToHomeScreen._(this.index);

  final int index;

  static void push(BuildContext context, int index) {
    Navigator.of(context).push<void>(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, animation, __) {
          final offset = Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offset,
              child: BackToHomeScreen._(index),
            ),
          );
        },
      ),
    );
  }

  @override
  State<BackToHomeScreen> createState() => _BackToHomeScreenState();
}

class _BackToHomeScreenState extends State<BackToHomeScreen> {
  void backToHome() {
    Navigator.of(context).pushAndRemoveUntil<void>(
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 400),
        pageBuilder: (_, animation, __) {
          final offset = Tween(begin: const Offset(0, 1), end: Offset.zero)
              .animate(animation);
          return FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: offset,
              child: HomeScreen(
                enableEntryAnimation: true,
                initialIndex: widget.index,
              ),
            ),
          );
        },
      ),
      ModalRoute.withName(''),
    );
  }

  @override
  void initState() {
    Future.delayed(const Duration(milliseconds: 1000), backToHome);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors.transparent,
      ),
      child: WillPopScope(
        onWillPop: () async => false,
        child: const Scaffold(
          backgroundColor: Colors.white,
        ),
      ),
    );
  }
}
