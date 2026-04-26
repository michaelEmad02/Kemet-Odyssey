import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/screens/favorites_screen.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/favorites/build_discover_more.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/favorites/build_featured_card.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/favorites/build_square_card.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/favorites/build_vertical_card.dart';

class BuildFavoritesBody extends StatelessWidget {
  const BuildFavoritesBody({
    super.key,
    required this.theme,
    required List<FavoriteItem> favoriteItems,
  }) : _favoriteItems = favoriteItems;

  final ThemeData theme;
  final List<FavoriteItem> _favoriteItems;

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverPadding(
          padding: EdgeInsets.only(
            top: MediaQuery.of(context).padding.top + kToolbarHeight + 32,
            bottom: 32,
            left: 24,
            right: 24,
          ),
          sliver: SliverToBoxAdapter(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Treasured Finds',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.bold,
                  ),
                ).animate().fadeIn(delay: 200.ms).slideX(begin: 0.1, end: 0),
                const SizedBox(height: 32),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Places',
                            style: theme.textTheme.headlineSmall
                                ?.copyWith(color: theme.colorScheme.primary)),
                        const SizedBox(height: 8),
                        Container(
                            height: 4,
                            width: 32,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(2))),
                      ],
                    ),
                    const SizedBox(width: 32),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Plans',
                            style: theme.textTheme.headlineSmall?.copyWith(
                                color: theme.colorScheme.onSurface
                                    .withOpacity(0.4))),
                        const SizedBox(height: 8),
                        Container(
                            height: 4,
                            width: 0,
                            decoration: BoxDecoration(
                                color: theme.colorScheme.primary,
                                borderRadius: BorderRadius.circular(2))),
                      ],
                    ),
                  ],
                ).animate().fadeIn(delay: 300.ms),
              ],
            ),
          ),
        ),
        BuildFavoritesList(favoriteItems: _favoriteItems),
      ],
    );
  }
}

class BuildFavoritesList extends StatelessWidget {
  const BuildFavoritesList({
    super.key,
    required List<FavoriteItem> favoriteItems,
  }) : _favoriteItems = favoriteItems;

  final List<FavoriteItem> _favoriteItems;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      sliver: SliverList.builder(
        itemCount: _favoriteItems.length,
        itemBuilder: (context, index) {
          final item = _favoriteItems[index];
          final delay = (400 + (index * 100)).ms;

          if (item.type == FavoriteCardType.featured) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: BuildFeaturedCard(
                      context: context,
                      title: item.title,
                      subtitle: item.subtitle!,
                      imageUrl: item.imageUrl!)
                  .animate()
                  .fadeIn(delay: delay)
                  .slideY(begin: 0.1, end: 0),
            );
          } else if (item.type == FavoriteCardType.square) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 24.0),
              child: BuildSquareCard(
                      context: context,
                      title: item.title,
                      imageUrl: item.imageUrl!)
                  .animate()
                  .fadeIn(delay: delay)
                  .slideY(begin: 0.1, end: 0),
            );
          } else if (item.type == FavoriteCardType.vertical) {
            // To handle pairs of vertical cards, we check if the next item is also vertical
            // This is a bit complex for a simple builder, so we'll check if index is the first of a pair
            // In this mock data, index 2 and 3 are vertical.
            if (index + 1 < _favoriteItems.length &&
                _favoriteItems[index + 1].type == FavoriteCardType.vertical) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: Row(
                  children: [
                    Expanded(
                      child: BuildVerticalCard(
                          context: context,
                          title: item.title,
                          imageUrl: item.imageUrl!),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: BuildVerticalCard(
                          context: context,
                          title: _favoriteItems[index + 1].title,
                          imageUrl: _favoriteItems[index + 1].imageUrl!),
                    ),
                  ],
                ).animate().fadeIn(delay: delay).slideY(begin: 0.1, end: 0),
              );
            } else if (index > 0 &&
                _favoriteItems[index - 1].type == FavoriteCardType.vertical) {
              // Skip if we already rendered this as part of a pair
              return const SizedBox.shrink();
            } else {
              // Single vertical card
              return Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: BuildVerticalCard(
                        context: context,
                        title: item.title,
                        imageUrl: item.imageUrl!)
                    .animate()
                    .fadeIn(delay: delay)
                    .slideY(begin: 0.1, end: 0),
              );
            }
          } else {
            return Padding(
              padding: const EdgeInsets.only(bottom: 120.0),
              child: BuildDiscoverMore(context: context)
                  .animate()
                  .fadeIn(delay: delay)
                  .slideY(begin: 0.1, end: 0),
            );
          }
        },
      ),
    );
  }
}
