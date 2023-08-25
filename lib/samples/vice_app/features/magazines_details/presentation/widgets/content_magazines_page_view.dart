import 'package:flutter/material.dart';
import 'package:flutter_samples/samples/vice_app/core/shared/domain/entities/magazine.dart';
import 'package:ui_common/ui_common.dart';

class ContentMagazinesPageView extends StatefulWidget {
  const ContentMagazinesPageView({
    required this.indexNotifier,
    required this.magazines,
    super.key,
  });

  final ValueNotifier<int> indexNotifier;
  final List<Magazine> magazines;

  @override
  State<ContentMagazinesPageView> createState() =>
      _ContentMagazinesPageViewState();
}

class _ContentMagazinesPageViewState extends State<ContentMagazinesPageView> {
  late final PageController controller;
  Size? sizeWidget;

  void indexListener() {
    controller.animateToPage(
      widget.indexNotifier.value,
      duration: const Duration(milliseconds: 600),
      curve: Curves.fastOutSlowIn,
    );
  }

  @override
  void initState() {
    controller = PageController(initialPage: widget.indexNotifier.value);
    widget.indexNotifier.addListener(indexListener);
    super.initState();
  }

  @override
  void dispose() {
    widget.indexNotifier.removeListener(indexListener);
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: sizeWidget?.height ?? 1.sh,
      child: PageView.builder(
        controller: controller,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: widget.magazines.length,
        itemBuilder: (_, index) {
          final magazine = widget.magazines[index];
          return SingleChildScrollView(
            physics: const NeverScrollableScrollPhysics(),
            padding: 20.edgeInsetsH,
            child: SizeNotifierWidget(
              onSizeChange: (value) => setState(() => sizeWidget = value),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  height20,
                  for (int x = 0; x < 5; x++) ...[
                    Text(
                      'TITLE TEST ${magazine.id}',
                      style: context.titleLarge.copyWith(letterSpacing: 2),
                    ),
                    height12,
                    Padding(
                      padding: 20.edgeInsetsR,
                      child: Text(
                        magazine.description,
                        style: context.bodyMedium.copyWith(letterSpacing: 1),
                      ),
                    ),
                    height12,
                    Padding(
                      padding: 20.edgeInsetsR,
                      child: Text(
                        magazine.description,
                        style: context.bodyMedium.copyWith(letterSpacing: 1),
                      ),
                    ),
                    height12,
                    Image.asset(
                      magazine.assetImage,
                      height: 220,
                      fit: BoxFit.cover,
                    ),
                    height28,
                  ]
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
