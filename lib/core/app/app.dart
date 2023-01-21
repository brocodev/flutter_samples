import 'package:flutter/material.dart';
import 'package:flutter_samples/core/constants/colors.dart';
import 'package:flutter_samples/src/presentation/screens/home_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter samples',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.scaffoldBackground,
      ),
      home: const HomeScreen(),
    );
  }
}
