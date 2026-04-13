import 'package:flutter/material.dart';

class BuildActionItem extends StatelessWidget {
  const BuildActionItem(
      {super.key,
      required this.theme,
      required this.icon,
      required this.text,
      required this.isDestructive,
      required this.onTap});
  final ThemeData theme;
  final IconData icon;
  final String text;
  final bool isDestructive;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    final color =
        isDestructive ? theme.colorScheme.error : theme.colorScheme.primary;
    final textColor =
        isDestructive ? theme.colorScheme.error : theme.colorScheme.onSurface;

    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceContainerHighest,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(icon, color: color),
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Text(text,
                    style: theme.textTheme.titleMedium?.copyWith(
                        color: textColor, fontWeight: FontWeight.bold))),
            if (!isDestructive)
              Icon(Icons.chevron_right,
                  color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
