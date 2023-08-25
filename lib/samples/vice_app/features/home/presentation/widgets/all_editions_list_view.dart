import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/core.dart';
import 'package:ui_common/ui_common.dart';

class AllEditionsListView extends StatelessWidget {
  const AllEditionsListView({
    required this.magazines,
    super.key,
  });

  final List<Magazine> magazines;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: 20.edgeInsetsH,
          child: const Text(
            'ALL EDITIONS',
            style: TextStyle(fontWeight: FontWeight.w600),
          ),
        ),
        height4,
        Expanded(
          child: ListView.builder(
            padding: 20.edgeInsetsH,
            itemCount: magazines.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final magazine = magazines[index];
              return Padding(
                padding: 12.edgeInsetsR,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: Image.asset(
                    magazine.assetImage,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
