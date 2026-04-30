import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_destinations_data_cubit.dart';

class BuildHeroSection extends StatelessWidget {
  const BuildHeroSection({
    super.key,
    required this.theme,required this.cityId,
  });

  final ThemeData theme;
  final int cityId;

  @override
  Widget build(BuildContext context) {
        var city = (context.watch<FetchDestinationsDataCubit>().state
            as FetchDestinationsDataLoaded)
        .cities
        .firstWhere((element) => element.id == cityId);
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.66,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl:
                city.imageUrl,
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
                  city.name,
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
