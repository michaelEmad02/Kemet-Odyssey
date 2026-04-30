import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/features/destinations/data/models/place_model.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/place_details_read_more_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/place_details_read_more_state.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/place_details_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build3_d_reconstruction.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_how_to_get_there.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_info_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_open_street_map.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_operating_schedule.dart';

class BuildPlaceDetailsContant extends StatelessWidget {
  const BuildPlaceDetailsContant({
    super.key,
    required this.today,
    required this.placeModel,
  });

  final PlaceModel placeModel;
  final int today;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final today = DateTime.now().weekday;
    return BlocProvider(
      create: (_) => PlaceDetailsReadMoreCubit(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          // ── Rating + Tags Row ───────────────────────────────────
          BuildRatingAndTags(
            theme: theme,
            category: placeModel.category,
            averageRating: 4.5,
            ratingCount: 12000,
          ).animate().fadeIn(delay: 500.ms),

          const SizedBox(height: 20,),

          // ── Title ───────────────────────────────────────────────
          Text(
            placeModel.name,
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),

          const SizedBox(height: 30),
        BuildChip(theme: theme, icon: Icons.architecture, label: placeModel.category),
          const SizedBox(height: 20),

          // ── Decorative Divider ──────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildHorizontalDivider(theme: theme),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.architecture,
                        color: theme.colorScheme.primaryContainer),
                    const SizedBox(width: 12),
                    Icon(Icons.history_edu,
                        color: theme.colorScheme.primaryContainer),
                    const SizedBox(width: 12),
                    Icon(Icons.temple_hindu,
                        color: theme.colorScheme.primaryContainer),
                  ],
                ),
              ),
              BuildHorizontalDivider(theme: theme),
            ],
          ).animate().fadeIn(delay: 600.ms),

          const SizedBox(height: 32),

          // ── Editorial Quote ─────────────────────────────────────
            BlocBuilder<PlaceDetailsReadMoreCubit, PlaceDetailsReadMoreState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '"${placeModel.description}"',
                      maxLines: state.isDescriptionExpanded ? null : 5,
                      overflow: state.isDescriptionExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: theme.textTheme.titleMedium?.copyWith(
                        fontStyle: FontStyle.italic,
                        color: theme.colorScheme.onSurfaceVariant,
                        height: 1.5,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context
                            .read<PlaceDetailsReadMoreCubit>()
                            .toggleDescription(),
                        child: Text(
                          state.isDescriptionExpanded
                              ? 'Read less'
                              : 'Read more',
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).animate().fadeIn(delay: 700.ms),

            const SizedBox(height: 16),

            BlocBuilder<PlaceDetailsReadMoreCubit, PlaceDetailsReadMoreState>(
              builder: (context, state) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'History :\n${placeModel.history}',
                      maxLines: state.isHistoryExpanded ? null : 5,
                      overflow: state.isHistoryExpanded
                          ? TextOverflow.visible
                          : TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        height: 1.7,
                        color: theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () => context
                            .read<PlaceDetailsReadMoreCubit>()
                            .toggleHistory(),
                        child: Text(
                          state.isHistoryExpanded ? 'Read less' : 'Read more',
                        ),
                      ),
                    ),
                  ],
                );
              },
            ).animate().fadeIn(delay: 800.ms),

          const SizedBox(height: 32),

          // ── Quick Facts ─────────────────────────────────────────
          // BuildPlaceQuickFacts(theme: theme)
          //     .animate()
          //     .fadeIn(delay: 900.ms)
          //     .slideY(begin: 0.1, end: 0),

          // const SizedBox(height: 32),

          // ── 3D Reconstruction ──────────────────────────────────
          if (placeModel.model3D.trim() != "")
            Build3DReconstruction(
              theme: theme,
              image3DUrl: placeModel.model3D,
            ),

          const SizedBox(height: 32),

          // ── Ticket Prices ───────────────────────────────────────
          BuildInfoCard(
            icon: Icons.confirmation_number_outlined,
            title: 'Ticket Prices',
            items: [
              MapEntry('Foreign Adult\nGeneral Admission', placeModel.price[0]),
              MapEntry('Foreign Student\nValid Student ID required',
                  placeModel.price[1]),
              // MapEntry('Egyptian National\nWith valid ID', 'EGP 30'),
            ],
            note: null,
            delay: 1000.ms,
          ),

          const SizedBox(height: 24),

          // ── Operating Schedule ──────────────────────────────────
          BuildOperatingSchedule(
                  theme: theme,
                  schedule: placeModel.operatingSchedule.operatingSchedule,
                  today: today)
              .animate()
              .fadeIn(delay: 1100.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 24),

          const SizedBox(height: 24),

          BuildOpenStreetMap(
            theme: theme,
            location: placeModel.location,
          )
              .animate()
              .fadeIn(delay: 1175.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 24),

          // ── How to Get There ────────────────────────────────────
          BuildHowToGetThere(theme: theme, location: placeModel.location)
              .animate()
              .fadeIn(delay: 1200.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}

class BuildRatingAndTags extends StatelessWidget {
  const BuildRatingAndTags({
    super.key,
    required this.theme,
    required this.averageRating,
    required this.ratingCount,
    required this.category,
  });

  final ThemeData theme;
  final double averageRating;
  final double ratingCount;
  final String category;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: theme.colorScheme.primary, size: 16),
              const SizedBox(width: 4),
              Text(averageRating.toString(),
                  style: theme.textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text(
                  '(${ratingCount > 999 ? ratingCount / 1000 : ratingCount}${ratingCount > 999 ? 'k' : ''})',
                  style: theme.textTheme.labelSmall
                      ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
      ],
    );
  }
}

class BuildChip extends StatelessWidget {
  const BuildChip(
      {super.key,
      required this.theme,
      required this.icon,
      required this.label});
  final ThemeData theme;
  final IconData icon;
  final String label;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainerLow,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
              color: theme.colorScheme.outlineVariant.withOpacity(0.7)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 14, color: theme.colorScheme.primary),
            const SizedBox(width: 4),
            Text(label,
                overflow: TextOverflow.ellipsis,
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: theme.colorScheme.primary)),
          ],
        ),
      ),
    );
  }
}
