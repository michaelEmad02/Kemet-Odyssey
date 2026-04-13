import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/place_details_screen.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build3_d_reconstruction.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_how_to_get_there.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_info_card.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_operating_schedule.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_place_details_body.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_place_quick_facts.dart';

class BuildPlaceDetailsContant extends StatelessWidget {
  const BuildPlaceDetailsContant({
    super.key,
    required this.widget,
    required List<Map<String, String>> schedule,
    required this.today,
  }) : _schedule = schedule;

  final BuildPlaceDetailsBody widget;
  final List<Map<String, String>> _schedule;
  final int today;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // ── Location Label ──────────────────────────────────────
          Row(
            children: [
              Icon(Icons.location_on_outlined,
                  color: widget.theme.colorScheme.primary, size: 16),
              const SizedBox(width: 4),
              Text(
                'THEBES, LUXOR',
                style: widget.theme.textTheme.labelSmall?.copyWith(
                  color: widget.theme.colorScheme.primary,
                  letterSpacing: 2,
                ),
              ),
            ],
          ).animate().fadeIn(delay: 300.ms),

          const SizedBox(height: 8),

          // ── Title ───────────────────────────────────────────────
          Text(
            'Karnak Temple Complex',
            style: widget.theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),

          const SizedBox(height: 16),

          // ── Rating + Tags Row ───────────────────────────────────
          BuildRatingAndTags(widget: widget).animate().fadeIn(delay: 500.ms),

          const SizedBox(height: 32),

          // ── Decorative Divider ──────────────────────────────────
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BuildHorizontalDivider(theme: widget.theme),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Icon(Icons.architecture,
                        color: widget.theme.colorScheme.primaryContainer),
                    const SizedBox(width: 12),
                    Icon(Icons.history_edu,
                        color: widget.theme.colorScheme.primaryContainer),
                    const SizedBox(width: 12),
                    Icon(Icons.temple_hindu,
                        color: widget.theme.colorScheme.primaryContainer),
                  ],
                ),
              ),
              BuildHorizontalDivider(theme: widget.theme),
            ],
          ).animate().fadeIn(delay: 600.ms),

          const SizedBox(height: 32),

          // ── Editorial Quote ─────────────────────────────────────
          Text(
            '"A sprawling city of temples, chapels, and pylons dedicated to the Theban Triad, where Pharaohs built monuments to eternity."',
            style: widget.theme.textTheme.titleLarge?.copyWith(
              fontStyle: FontStyle.italic,
              color: widget.theme.colorScheme.onSurfaceVariant,
              height: 1.5,
            ),
          ).animate().fadeIn(delay: 700.ms),

          const SizedBox(height: 16),

          Text(
            'The Karnak Temple Complex, commonly known as Karnak, comprises a vast mix of decayed temples, chapels, pylons, and other buildings near Luxor, Egypt. Construction at the complex began during the reign of Senusret I in the Middle Kingdom and continued into the Ptolemaic period, representing over 2,000 years of building activity.',
            style: widget.theme.textTheme.bodyLarge?.copyWith(
              height: 1.7,
              color: widget.theme.colorScheme.onSurfaceVariant,
            ),
          ).animate().fadeIn(delay: 800.ms),

          const SizedBox(height: 32),

          // ── Quick Facts ─────────────────────────────────────────
          BuildPlaceQuickFacts(widget: widget)
              .animate()
              .fadeIn(delay: 900.ms)
              .slideY(begin: 0.1, end: 0),

          const SizedBox(height: 32),

          // ── 3D Reconstruction ──────────────────────────────────
          Build3DReconstruction(theme: widget.theme),

          const SizedBox(height: 32),

          // ── Ticket Prices ───────────────────────────────────────
          BuildInfoCard(
            icon: Icons.confirmation_number_outlined,
            title: 'Ticket Prices',
            items: const [
              MapEntry('Foreign Adult\nGeneral Admission', 'EGP 450'),
              MapEntry('Foreign Student\nValid Student ID required', 'EGP 225'),
              MapEntry('Egyptian National\nWith valid ID', 'EGP 30'),
            ],
            note: null,
            delay: 1000.ms,
          ),

          const SizedBox(height: 24),

          // ── Operating Schedule ──────────────────────────────────
          BuildOperatingSchedule(theme: widget.theme, schedule: _schedule, today: today).animate().fadeIn(delay: 1100.ms).slideY(begin: 0.1, end: 0),

          const SizedBox(height: 24),

          // ── How to Get There ────────────────────────────────────
          BuildHowToGetThere(widget: widget).animate().fadeIn(delay: 1200.ms).slideY(begin: 0.1, end: 0),

          const SizedBox(height: 80),
        ],
      ),
    );
  }
}

class BuildRatingAndTags extends StatelessWidget {
  const BuildRatingAndTags({
    super.key,
    required this.widget,
  });

  final BuildPlaceDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          decoration: BoxDecoration(
            color: widget.theme.colorScheme.surfaceContainerLow,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star,
                  color: widget.theme.colorScheme.primary, size: 16),
              const SizedBox(width: 4),
              Text('4.9',
                  style: widget.theme.textTheme.labelMedium
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(width: 4),
              Text('(12.4k)',
                  style: widget.theme.textTheme.labelSmall?.copyWith(
                      color: widget.theme.colorScheme.onSurfaceVariant)),
            ],
          ),
        ),
        const SizedBox(width: 12),
        BuildChip(
            theme: widget.theme, icon: Icons.architecture, label: 'Temple'),
        const SizedBox(width: 8),
      ],
    );
  }
}
