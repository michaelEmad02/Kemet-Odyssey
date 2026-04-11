// ─────────────────────────────────────────────
// Footer Quote
// ─────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class FooterQuote extends StatelessWidget {
  const FooterQuote({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        Container(
          width: 48,
          height: 1,
          color: theme.colorScheme.outlineVariant,
        ).animate().fadeIn(delay: 1000.ms),
        const SizedBox(height: 12),
        Text(
          '"Time stays long enough for those who use it."',
          style: theme.textTheme.titleMedium?.copyWith(
            fontFamily: 'Noto Serif',
            fontStyle: FontStyle.italic,
            color: theme.colorScheme.tertiary,
          ),
        ).animate().fadeIn(delay: 1100.ms),
        const SizedBox(height: 4),
        Text(
          'VERSION 2.4.0 — THE NILE COLLECTION',
          style: theme.textTheme.labelSmall?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
          ),
        ).animate().fadeIn(delay: 1200.ms),
      ],
    );
  }
}
