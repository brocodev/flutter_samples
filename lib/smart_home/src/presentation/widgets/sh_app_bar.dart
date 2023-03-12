import 'package:flutter/material.dart';
import 'package:flutter_samples/smart_home/core/constants/icons.dart';
import 'package:ui_common/ui_common.dart';

class SHAppBar extends StatelessWidget implements PreferredSizeWidget {
  const SHAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Hero(
        tag: 'app-bar-icon-1',
        child: Material(
          type: MaterialType.transparency,
          child: IconButton(
            onPressed: () {},
            icon: const Icon(SHIcons.menu),
          ),
        ),
      ),
      actions: [
        Hero(
          tag: 'app-bar-icon-2',
          child: Material(
            type: MaterialType.transparency,
            child: IconButton(
              onPressed: () {},
              icon: const Icon(SHIcons.search),
            ),
          ),
        ),
        width12,
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
