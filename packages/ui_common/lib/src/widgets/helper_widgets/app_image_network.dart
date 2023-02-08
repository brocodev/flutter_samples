import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:ui_common/ui_common.dart';

/// Custom image network widget.
class AppImageNetwork extends StatelessWidget {
  /// Custom image network widget.
  const AppImageNetwork({
    Key? key,
    required this.imageUrl,
    this.height,
    this.width,
    this.borderRadius,
    this.fit = BoxFit.cover,
    this.loadingIndicator,
    this.backgroundColor,
    this.shape = BoxShape.rectangle,
    this.errorWidget,
  }) : super(key: key);

  /// Image network with a box shape.
  factory AppImageNetwork.box({
    Key? key,
    required double size,
    required String? url,
    BorderRadius? borderRadius,
    BoxFit fit = BoxFit.cover,
    Widget? loadingIndicator,
    Color? backgroundColor,
    BoxShape shape = BoxShape.rectangle,
    Widget? errorWidget,
  }) {
    return AppImageNetwork(
      key: key,
      imageUrl: url,
      height: size,
      width: size,
      borderRadius: borderRadius,
      fit: fit,
      loadingIndicator: loadingIndicator,
      backgroundColor: backgroundColor,
      shape: shape,
      errorWidget: errorWidget,
    );
  }

  /// Image network with a circle shape.
  factory AppImageNetwork.circle({
    Key? key,
    required double size,
    required String? url,
    BoxFit fit = BoxFit.cover,
    Widget? loadingIndicator,
    Color? backgroundColor,
    Widget? errorWidget,
  }) {
    return AppImageNetwork(
      key: key,
      imageUrl: url,
      height: size,
      width: size,
      fit: fit,
      loadingIndicator: loadingIndicator,
      backgroundColor: backgroundColor,
      shape: BoxShape.circle,
      errorWidget: errorWidget,
    );
  }

  /// Image url.
  final String? imageUrl;

  /// Image height.
  final double? height;

  /// Image width.
  final double? width;

  /// Image border radius.
  final BorderRadius? borderRadius;

  /// Loading indicator.
  final Widget? loadingIndicator;

  /// Image fit.
  final BoxFit fit;

  /// Background color.
  final Color? backgroundColor;

  /// Image shape.
  final BoxShape shape;

  /// Error placeholder widget
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        shape: shape,
        borderRadius: borderRadius,
        color: backgroundColor ?? context.backgroundColor,
      ),
      child: imageUrl != null
          ? CachedNetworkImage(
              imageUrl: imageUrl!,
              height: height,
              width: width,
              fit: fit,
              placeholder: (context, url) =>
                  loadingIndicator ??
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Icon(
                        Icons.image,
                        size: 18,
                        color: context.textColor.withOpacity(.1),
                      ),
                      Center(
                        child: CircularProgressIndicator(
                          strokeWidth: 3,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            context.textColor.withOpacity(.1),
                          ),
                        ),
                      ),
                    ],
                  ),
              errorWidget: (_, __, ___) =>
                  errorWidget ??
                  Icon(
                    Icons.error_outline,
                    size: (height ?? 60.sp) * .5,
                    color: context.textColor.withOpacity(.3),
                  ),
            )
          : Center(
              child: SizedBox(
                height: height ?? 60.sp,
                width: width ?? 60.sp,
                child: errorWidget ??
                    Icon(
                      Icons.error_outline,
                      size: (height ?? 60.sp) * .5,
                      color: context.textColor.withOpacity(.3),
                    ),
              ),
            ),
    );
  }
}
