import 'package:flutter/material.dart';

/// {@template [SizeNotifierWidget]}
/// This widget notifies through its onSizeChanged method that when it is
/// executed send as parameter an object [Size] with the information of the
/// size of their child
/// {@endtemplate}
class SizeNotifierWidget extends StatefulWidget {
  /// {@macro [SizeNotifierWidget]}
  const SizeNotifierWidget({
    required this.child,
    required this.onSizeChange,
    super.key,
  });

  /// Child of the widget
  final Widget child;

  /// When change size
  final ValueChanged<Size> onSizeChange;

  @override
  State<SizeNotifierWidget> createState() => _SizeNotifierWidgetState();
}

class _SizeNotifierWidgetState extends State<SizeNotifierWidget> {
  final _widgetKey = GlobalKey();
  Size? _oldSize;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<SizeChangedLayoutNotification>(
      onNotification: (_) {
        WidgetsBinding.instance.addPostFrameCallback((_) => _notifySize());
        return true;
      },
      child: SizeChangedLayoutNotifier(
        child: SizedBox(
          key: _widgetKey,
          child: widget.child,
        ),
      ),
    );
  }

  void _notifySize() {
    final context = _widgetKey.currentContext;
    if (context == null) return;
    final size = context.size;
    if (_oldSize != size) {
      _oldSize = size;
      widget.onSizeChange(size!);
    }
  }
}
