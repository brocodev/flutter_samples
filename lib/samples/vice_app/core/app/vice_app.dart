import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:ui_common/ui_common.dart';

import '../../features/home/presentation/screens/home_screen.dart';

class ViceApp extends StatelessWidget {
  const ViceApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (_, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        theme: ViceTheme.theme,
        home: const HomeScreen(),
      ),
    );
  }
}
