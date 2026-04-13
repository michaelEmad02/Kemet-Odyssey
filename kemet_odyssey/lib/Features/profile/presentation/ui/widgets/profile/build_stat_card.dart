import 'package:flutter/material.dart';

class BuildStatCard extends StatelessWidget {
  const BuildStatCard(
      {super.key,
      required this.theme,
      required this.icon,
      required this.value,
      required this.label,
      required this.iconColor});
  final ThemeData theme;
  final IconData icon;
  final String value;
  final String label;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
        border: Border(
          top: BorderSide(
              color: theme.colorScheme.primary.withOpacity(0.2), width: 2),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, color: iconColor),
          const SizedBox(height: 8),
          Text(value,
              style: theme.textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold, fontStyle: FontStyle.italic)),
          Text(label.toUpperCase(),
              style: theme.textTheme.labelSmall
                  ?.copyWith(color: theme.colorScheme.onSurfaceVariant)),
        ],
      ),
    );
  }
}

