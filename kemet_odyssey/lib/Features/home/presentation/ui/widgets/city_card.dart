import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/home/domain/entities/city_entity.dart';

class CityCard extends StatelessWidget {
  final CityEntity city;


  const CityCard({
    super.key,
    required this.city,
 
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return InkWell(
      onTap: () {
        context.pushNamed(
          'city_details',
          pathParameters: {'id': city.name.toLowerCase().replaceAll(' ', '_')},
        );
      },
      child: Container(
        //width: width,
        //height: width * 1.5, // Maintain aspect ratio
        margin: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border(
            top: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.2), width: 2),
            left: BorderSide(
                color: theme.colorScheme.primary.withOpacity(0.2), width: 2),
          ),
        ),
        child: BuildCardBody(city: city, theme: theme),
      ),
    )
        .animate()
        .fadeIn(delay: const Duration(milliseconds: 700))
        .slideX(begin: 0.1, end: 0);
  }
}

class BuildCardBody extends StatelessWidget {
  const BuildCardBody({
    super.key,
    required this.city,
    required this.theme,
  });

  final CityEntity city;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: city.imageUrl,
            fit: BoxFit.cover,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  theme.scaffoldBackgroundColor.withOpacity(0.99),
                  Colors.transparent,
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.center,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    city.name,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Colors.white.withOpacity(0.8),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    city.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: Colors.white.withOpacity(0.7),
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 24),
                  Container(
                    height: 4,
                    width: 48,
                    color: theme.colorScheme.primary.withOpacity(0.5),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
