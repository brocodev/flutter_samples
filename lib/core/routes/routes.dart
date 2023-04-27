import 'package:flutter/cupertino.dart';
import 'package:flutter_samples/core/shared/presentation/screens/samples_screen.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> routes = {
    '/': (context) => const SamplesScreen(),
  };
}
