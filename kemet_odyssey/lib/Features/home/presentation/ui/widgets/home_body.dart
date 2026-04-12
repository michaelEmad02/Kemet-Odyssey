import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/home/domain/entities/city_entity.dart';
import 'package:kemet_odyssey/features/home/domain/entities/place_entity.dart';
import 'package:kemet_odyssey/features/home/domain/entities/plan_entity.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_cities_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_places_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_plans_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/section_header.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.theme,
    required this.isDark,
    required List<CityEntity> cities,
    required List<PlaceEntity> places,
    required List<PlanEntity> plans,
  })  : _cities = cities,
        _places = places,
        _plans = plans;

  final ThemeData theme;
  final bool isDark;
  final List<CityEntity> _cities;
  final List<PlaceEntity> _places;
  final List<PlanEntity> _plans;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight - 20,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Hero Section
                HeroSection(theme: theme, isDark: isDark),

                const SizedBox(height: 20),

                // Explore Cities
                SectionHeader(
                  title: 'Explore Cities',
                  animationDelay: const Duration(milliseconds: 400),
                  onViewAll: () {
                    context.pushNamed('cities');
                  },
                ),
                BuildCitiesListView(
                    cities: _cities,),

                const SizedBox(height: 25),

                // Popular Places
                Container(
                  color: theme.colorScheme.surfaceContainerLow,
                  padding: const EdgeInsets.symmetric(vertical: 0),
                  child: Column(
                    children: [
                      const SectionHeader(
                        title: 'Popular Places',
                        subtitle: 'Trending destinations for modern explorers',
                        animationDelay: Duration(milliseconds: 800),
                      ).animate().flip(delay: 400.ms),
                      BuildPlacesListView(
                          places: _places),
                    ],
                  ),
                ),

                const SizedBox(height: 25),

                // Suggested Plans
                const SectionHeader(
                  title: 'Suggested Plans',
                  subtitle: 'Itineraries curated by historical experts',
                  animationDelay: Duration(milliseconds: 1200),
                ),
                BuildPlansListView(plans: _plans),
                const SizedBox(height: 100), // Bottom padding
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Land of Kemet',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              letterSpacing: 3.0,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
          const SizedBox(height: 8),
          Text(
            'Your Odyssey\nBegins Here.',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
        ],
      ),
    );
  }
}
