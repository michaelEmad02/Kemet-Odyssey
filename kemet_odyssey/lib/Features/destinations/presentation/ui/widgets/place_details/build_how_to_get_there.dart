import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_place_details_body.dart';

class BuildHowToGetThere extends StatelessWidget {
  const BuildHowToGetThere({
    super.key,
    required this.widget,
  });

  final BuildPlaceDetailsBody widget;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: widget.theme.colorScheme.surfaceContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: widget.theme.colorScheme.secondary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.near_me_outlined,
                color: widget.theme.colorScheme.secondary, size: 28),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Getting There',
                  style: widget.theme.textTheme.titleMedium
                      ?.copyWith(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 4),
                Text(
                  'East Bank, Luxor City. 30 min from Luxor Airport via taxi.',
                  style: widget.theme.textTheme.bodySmall?.copyWith(
                      color: widget.theme.colorScheme.onSurfaceVariant),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right,
              color: widget.theme.colorScheme.onSurfaceVariant),
        ],
      ),
    );
  }
}
