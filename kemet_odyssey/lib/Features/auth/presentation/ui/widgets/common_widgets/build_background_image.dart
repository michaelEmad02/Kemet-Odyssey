import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildBackgroundImage extends StatelessWidget {
  const BuildBackgroundImage(
      {super.key, required this.imagePath, required this.color});

  final String imagePath;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      fit: BoxFit.cover,
      color: color,
      colorBlendMode: BlendMode.darken,
    ).animate().fadeIn(duration: 1.seconds);
  }
}
