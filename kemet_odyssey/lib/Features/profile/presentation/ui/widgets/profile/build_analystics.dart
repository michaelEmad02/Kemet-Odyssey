import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_stat_card.dart';

class BuildAnalystics extends StatelessWidget {
  const BuildAnalystics({super.key, required this.theme});
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
         Row(
              children: [
                Expanded(
                  child: BuildStatCard(
                    theme: theme,
                    icon:  Icons.temple_buddhist,
                    value: '42',
                    label: 'Places Visited',
                    iconColor:  Colors
                        .blueGrey, // Just a specific accent loosely based off UI text
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: BuildStatCard(
                    theme:  theme,
                    icon:  Icons.auto_awesome,
                    value: '12',
                    label: 'Plans Created',
                    iconColor: theme.colorScheme.secondary,
                  ),
                ),
              ],
            ).animate().fadeIn(delay: 500.ms).slideY(begin: 0.1, end: 0),

            const SizedBox(height: 16),

            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerLow,
                borderRadius: BorderRadius.circular(20),
                border: Border(
                  left: BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      width: 2),
                  bottom: BorderSide(
                      color: theme.colorScheme.primary.withOpacity(0.2),
                      width: 2),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(Icons.timeline, color: theme.colorScheme.primary),
                      const SizedBox(height: 8),
                      Text('7,000+',
                          style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.italic)),
                      Text('YEARS OF HISTORY EXPLORED',
                          style: theme.textTheme.labelSmall?.copyWith(
                              color: theme.colorScheme.onSurfaceVariant)),
                    ],
                  ),
                  Icon(Icons.history_edu,
                      size: 64,
                      color: theme.colorScheme.onSurface.withOpacity(0.05)),
                ],
              ),
            ).animate().fadeIn(delay: 600.ms).slideY(begin: 0.1, end: 0),
      ],
    );
  }
}
