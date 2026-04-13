import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';

class BuildLandmarkCard extends StatelessWidget {
  const BuildLandmarkCard(
      {super.key,
      required this.tag,
      required this.title,
      required this.imageUrl,
      required this.delay});
  final String tag;
  final String title;
  final String imageUrl;
  final Duration delay;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 4.7 / 5,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: theme.colorScheme.surfaceContainer,
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Stack(
            fit: StackFit.expand,
            children: [
              CachedNetworkImage(
                imageUrl: imageUrl,
                fit: BoxFit.cover,
              ),
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    colors: [Colors.black87, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.center,
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 24,
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    border: Border.all(
                      color: Colors.black.withOpacity(0.5),
                    ),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.filter_vintage,
                        size: 18,
                        color: AppColors.darkPrimary,
                      ),
                      const SizedBox(width: 5),
                      Text(tag.toUpperCase(),
                          style: theme.textTheme.labelSmall?.copyWith(
                              color: Colors.white, letterSpacing: 2)),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 24,
                left: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold, color: Colors.white)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    ).animate().fadeIn(delay: delay).slideY(begin: 0.1, end: 0);
  }
}
