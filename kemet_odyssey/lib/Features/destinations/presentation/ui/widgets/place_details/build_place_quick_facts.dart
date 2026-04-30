import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/screens/place_details_screen.dart';

class BuildPlaceQuickFacts extends StatelessWidget {
  const BuildPlaceQuickFacts({
    super.key, required this.theme,
  }); 

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLowest,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(
              color: theme.colorScheme.primary.withOpacity(0.25)),
          left: BorderSide(
              color: theme.colorScheme.primary.withOpacity(0.25)),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Quick Facts',
            style: theme.textTheme.titleLarge?.copyWith(
              color: theme.colorScheme.primary,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          const BuildFactRow(
              icon: Icons.calendar_today_outlined,
              label: 'BUILT',
              value: '2055 BC – 100 AD'),
          const SizedBox(height: 16),
          const BuildFactRow(
              icon: Icons.layers_outlined, label: 'AREA', value: '247 Acres'),
          const SizedBox(height: 16),
          const BuildFactRow(
              icon: Icons.emoji_events_outlined,
              label: 'STATUS',
              value: 'UNESCO World Heritage'),
          const SizedBox(height: 16),
          const BuildFactRow(
              icon: Icons.directions_walk_outlined,
              label: 'TOUR DURATION',
              value: '2–4 Hours'),
        ],
      ),
    );
  }
}
