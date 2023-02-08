import 'package:flutter/material.dart';

extension NavigationExt on BuildContext {
  Future<T?> pushNamed<T>(String route, {Object? args}) async {
    return Navigator.pushNamed<T>(this, route, arguments: args);
  }

  Future<T?> pushReplaceNamed<T, TO>(String route, {Object? args}) async {
    return Navigator.pushReplacementNamed<T, TO>(this, route, arguments: args);
  }

  void pop<T>([T? result]) {
    return Navigator.pop<T>(this, result);
  }

  Future<void> popUntil(RoutePredicate predicate) async {
    return Navigator.popUntil(this, predicate);
  }

  Future<T?> pushNamedAndRemoveUntil<T, TO>(
    String route,
    RoutePredicate predicate, {
    Object? args,
  }) async {
    return Navigator.pushNamedAndRemoveUntil<T>(
      this,
      route,
      predicate,
      arguments: args,
    );
  }
}
