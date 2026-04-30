import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_artifact_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_cities_list.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/explore_cities/build_screen_header.dart';

class BuildExploreCitiesBody extends StatelessWidget {
  const BuildExploreCitiesBody({
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
        BuildScreenHeader(theme: theme, isDark: isDark),
        const SliverToBoxAdapter(child: SizedBox(height: 32)),
        const BuildCitiesList(),
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
