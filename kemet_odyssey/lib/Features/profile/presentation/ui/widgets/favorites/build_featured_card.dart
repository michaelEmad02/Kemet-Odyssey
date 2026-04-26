import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildFeaturedCard extends StatelessWidget {
  const BuildFeaturedCard({
    super.key,
    required this.context,
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final BuildContext context;
  final String title;
  final String subtitle;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 16 / 10,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
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
              const Positioned(
                top: 16,
                right: 16,
                child: CircleAvatar(
                  backgroundColor: Colors.black45,
                  child:
                      Icon(Icons.favorite, color: Colors.orange), // Custom tint
                ),
              ),
              Positioned(
                bottom: 24,
                left: 24,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(subtitle,
                        style: theme.textTheme.labelSmall?.copyWith(
                            color: theme.colorScheme.secondary,
                            letterSpacing: 2)),
                    Text(title,
                        style: theme.textTheme.headlineMedium?.copyWith(
                            color: Colors.white, fontStyle: FontStyle.italic)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
