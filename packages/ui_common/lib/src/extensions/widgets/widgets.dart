import 'package:flutter/material.dart';

extension WidgetUIExt on Widget {
  Widget get sliver => SliverToBoxAdapter(child: this);
}
