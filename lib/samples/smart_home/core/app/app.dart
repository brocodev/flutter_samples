import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_samples/samples/smart_home/core/theme/sh_theme.dart';
import 'package:flutter_samples/samples/smart_home/features/home/presentation/screens/home_screen.dart';
import 'package:ui_common/ui_common.dart';

class SmartHomeApp extends StatelessWidget {
  const SmartHomeApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.light.copyWith(statusBarColor: Colors.transparent),
    );
    return ScreenUtilInit(
      builder: (_, child) => MaterialApp(
        title: 'Smart Home App',
        debugShowCheckedModeBanner: false,
        theme: SHTheme.dark,
        home: child,
      ),
      child: const HomeScreen(),
    );
  }
}
