import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Duration animationDelay;
  final VoidCallback? onViewAll;

  const SectionHeader({
    super.key,
    required this.title,
    this.subtitle,
    this.animationDelay = Duration.zero,
    this.onViewAll,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    subtitle!,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: theme.colorScheme.onSurfaceVariant,
                    ),
                  ),
                ] else ...[
                  Container(
                    margin: const EdgeInsets.only(top: 8),
                    height: 4,
                    width: 48,
                    color: theme.colorScheme.primary,
                  ),
                ]
              ],
            ),
          ),
          if (subtitle == null)
            TextButton(
              onPressed: onViewAll ?? () {},
              child: Row(
                children: [
                  Text('VIEW ALL',
                      style: theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.primary,
                          fontWeight: FontWeight.bold)),
                  const SizedBox(width: 4),
                  Icon(Icons.arrow_forward,
                      size: 16, color: theme.colorScheme.primary),
                ],
              ),
            ),
        ],
      ).animate().fadeIn(delay: animationDelay).slideY(begin: 0.1, end: 0),
    );
  }
}
