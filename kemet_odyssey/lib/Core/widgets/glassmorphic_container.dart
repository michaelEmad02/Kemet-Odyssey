import 'dart:ui';
import 'package:flutter/material.dart';

class GlassmorphicContainer extends StatelessWidget {
  final Widget child;
  final double blur;
  final Color overlayColor;
  final BorderRadiusGeometry? borderRadius;
  final BoxBorder? border;

  const GlassmorphicContainer({
    super.key,
    required this.child,
    this.blur = 20.0,
    this.overlayColor =
        const Color(0x99353535), // Default to Surface-Variant 60%
    this.borderRadius,
    this.border,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.zero,
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blur, sigmaY: blur),
        child: Container(
          decoration: BoxDecoration(
            color: overlayColor,
            borderRadius: borderRadius,
            border: border,
          ),
          child: child,
        ),
      ),
    );
  }
}
