import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';

class PlaceCard extends StatelessWidget {
  final PlaceEntity place;

  const PlaceCard({
    super.key,
    required this.place,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () {
        context.pushNamed(
          'place_details',
          pathParameters: {'id': place.name.toLowerCase().replaceAll(' ', '_')},
        );
      },
      child: Container(
        //width: width,
        margin: const EdgeInsets.symmetric(vertical: 8.0),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerHighest,
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
              color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
          boxShadow: const [
            BoxShadow(
                color: Colors.black12, blurRadius: 10, offset: Offset(0, 4))
          ],
        ),
        child: BuildCardBody(place: place, theme: theme),
      )
          .animate()
          .fadeIn(delay: const Duration(milliseconds: 800))
          .slideX(begin: 0.1, end: 0),
    );
  }
}

class BuildCardBody extends StatelessWidget {
  const BuildCardBody({
    super.key,
    required this.place,
    required this.theme,
  });

  final PlaceEntity place;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AspectRatio(
          aspectRatio: 3.4 / 3,
          child: ClipRRect(
            borderRadius:
                const BorderRadius.vertical(top: Radius.circular(15)),
            child: CachedNetworkImage(
              imageUrl: place.mainImage,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(16,16,16,10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                place.category,
                style: theme.textTheme.labelSmall?.copyWith(
                  color: theme.colorScheme.secondary,
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                place.name,
                style: theme.textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Noto Serif',
                ),
              ),
              const SizedBox(height: 5,),
              Text(
                place.description,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: theme.textTheme.titleSmall?.color?.withOpacity(0.8),
                  fontWeight: FontWeight.w200,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
