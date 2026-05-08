import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_cities_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_places_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_plans_list_view.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/build_shimmer_list.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/hero_section.dart';
import 'package:kemet_odyssey/features/home/presentation/ui/widgets/section_header.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_cities_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_places_bloc.dart';
import 'package:kemet_odyssey/features/home/presentation/manager/bloc/fetch_top_plans_bloc.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

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
                    context.pushNamed('exploreCities');
                  },
                ),
                BlocBuilder<FetchTopCitiesBloc, FetchTopCitiesState>(
                  builder: (context, state) {
                    if (state is FetchTopCitiesLoading) {
                      return BuildShimmerList(
                          isDark: isDark,
                          context: context,
                          height: MediaQuery.of(context).size.height * .40);
                    } else if (state is FetchTopCitiesLoaded) {
                      return BuildCitiesListView(cities: state.topCities);
                    } else if (state is FetchTopCitiesFailure) {
                      return _buildErrorWidget(state.errorMessage);
                    }
                    return const SizedBox();
                  },
                ),

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
                      BlocBuilder<FetchTopPlacesBloc, FetchTopPlacesState>(
                        builder: (context, state) {
                          if (state is FetchTopPlacesLoading) {
                            return BuildShimmerList(
                                isDark: isDark,
                                context: context,
                                height:
                                    MediaQuery.of(context).size.height * .40);
                          } else if (state is FetchTopPlacesLoaded) {
                            return BuildPlacesListView(places: state.topPlaces);
                          } else if (state is FetchTopPlacesFailure) {
                            return _buildErrorWidget(state.errorMessage);
                          }
                          return const SizedBox();
                        },
                      ),
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
                BlocBuilder<FetchTopPlansBloc, FetchTopPlansState>(
                  builder: (context, state) {
                    if (state is FetchTopPlansLoading) {
                      return BuildShimmerList(
                          isDark: isDark,
                          context: context,
                          height: MediaQuery.of(context).size.height * .37);
                    } else if (state is FetchTopPlansLoaded) {
                      if (state.topPlans.isEmpty) {
                        return const Center(
                          child: Text('No plans found'),
                        );
                      }
                      return BuildPlansListView(plans: state.topPlans);
                    } else if (state is FetchTopPlansFailure) {
                      return _buildErrorWidget(state.errorMessage);
                    }
                    return const SizedBox();
                  },
                ),
                const SizedBox(height: 100), // Bottom padding
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildErrorWidget(String message) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(Icons.error_outline, color: theme.colorScheme.error, size: 40),
            const SizedBox(height: 10),
            Text(
              message,
              textAlign: TextAlign.center,
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.error,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
