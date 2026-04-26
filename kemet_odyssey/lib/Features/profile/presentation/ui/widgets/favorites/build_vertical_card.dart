import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class BuildVerticalCard extends StatelessWidget {
  const BuildVerticalCard({
    super.key,
    required this.context,
    required this.title,
    required this.imageUrl,
  });

  final BuildContext context;
  final String title;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AspectRatio(
      aspectRatio: 4 / 5,
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
                bottom: 16,
                left: 16,
                child: Text(title,
                    style: theme.textTheme.titleMedium
                        ?.copyWith(color: Colors.white)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
