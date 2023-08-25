import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';

class MenuButton extends StatelessWidget {
  const MenuButton({
    super.key,
    this.color = Colors.white70,
  });

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'menu-button',
      child: Material(
        type: MaterialType.transparency,
        child: IconButton(
          onPressed: () {},
          icon: Icon(ViceIcons.menu, size: 30, color: color),
        ),
      ),
    );
  }
}
