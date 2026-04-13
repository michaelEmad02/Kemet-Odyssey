import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class BuildHeroSection extends StatelessWidget {
  const BuildHeroSection({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl:
                'https://lh3.googleusercontent.com/aida-public/AB6AXuBj5XyMWI_9c3y5EwHqvQWOq8c8K2UVPtQQKWS7pWaoSkadwWDzuO2HX5rMBuiWaIe0eTAnDYprHTrTaCrpfsDgjImm6eWRaRmqL8xW2prpxfVjxus8CfcbLtbbKy4uwskiA_LFVCNgi7i2qhw5vYZVkGmeFL25Io2ez0RlF9P441KwhCt-vrgUaWkrYQqCW7WYCpAfgs60zv9kE17lalSmNn72Zr2IAdoQ2Sfbo6IiUPSqr4hA0JGngga9RQPxRWD05tNa-DqOSPU',
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.scaffoldBackgroundColor.withOpacity(0.95),
                  theme.scaffoldBackgroundColor.withOpacity(0.1),
                  Colors.transparent.withOpacity(0.1)
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
              ),
            ),
          ),
          Positioned(
            bottom: 40,
            left: 24,
            right: 24,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Luxor',
                  style: theme.textTheme.displayLarge?.copyWith(
                    fontWeight: FontWeight.w900,
                    shadows: [
                      const Shadow(
                          color: Colors.black45, blurRadius: 20)
                    ],
                  ),
                )
                    .animate()
                    .fadeIn(delay: 500.ms)
                    .slideX(begin: -0.1, end: 0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
