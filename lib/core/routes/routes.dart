import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/core/shared/domain/entities/sample.dart';
import 'package:flutter_samples/core/shared/presentation/screens/samples_screen.dart';
import 'package:flutter_samples/samples/smart_home/core/app/app.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SamplesScreen(),
    Sample.smartHome.route: (context) => const SmartHomeApp()
  };
}
