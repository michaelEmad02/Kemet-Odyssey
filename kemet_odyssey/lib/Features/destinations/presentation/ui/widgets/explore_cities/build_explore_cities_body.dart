import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/explore_cities_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_artifact_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_city_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_screen_header.dart';

class BuildExploreCitiesBody extends StatelessWidget {
  const BuildExploreCitiesBody({
    super.key,
    required this.theme,
    required this.isDark,
    required List<CityExplorerItem> explorerItems,
  }) : _explorerItems = explorerItems;

  final ThemeData theme;
  final bool isDark;
  final List<CityExplorerItem> _explorerItems;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        BuildScreenHeader(theme: theme, isDark: isDark),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        BuildCitiesList(explorerItems: _explorerItems),
        const SliverToBoxAdapter(child: SizedBox(height: 48)),
        SliverPadding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          sliver: SliverToBoxAdapter(
            child: BuildArtifactCard(delay: 1000.ms),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 120)),
      ],
    );
  }
}

class BuildCitiesList extends StatelessWidget {
  const BuildCitiesList({
    super.key,
    required List<CityExplorerItem> explorerItems,
  }) : _explorerItems = explorerItems;

  final List<CityExplorerItem> _explorerItems;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      sliver: SliverList.separated(
        itemCount: _explorerItems.length,
        separatorBuilder: (context, index) => const SizedBox(height: 24),
        itemBuilder: (context, index) {
          final item = _explorerItems[index];
          final delay = (500 + (index * 100)).ms;
          return BuildCityCard(
            item: item,
            delay: delay,
            height: MediaQuery.of(context).size.height * 0.45,
          );
        },
      ),
    );
  }
}
