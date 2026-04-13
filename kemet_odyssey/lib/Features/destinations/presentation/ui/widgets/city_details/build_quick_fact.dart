import 'package:flutter/material.dart';
class BuildQuickFacts extends StatelessWidget {
  const BuildQuickFacts({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: theme.colorScheme.surfaceContainerLow,
        borderRadius: BorderRadius.circular(20),
      ),
      child: const Column(
        children: [
          BuildQuickFact(
              icon: Icons.wb_sunny,
              label: 'Weather',
              value: '32°C'),
          Divider(height: 32),
          BuildQuickFact(
              icon: Icons.schedule,
              label: 'Timezone',
              value: 'GMT +2'),
          Divider(height: 32),
          BuildQuickFact(
              icon: Icons.payments,
              label: 'Currency',
              value: 'EGP'),
        ],
      ),
    );
  }
}

class BuildQuickFact extends StatelessWidget {
  const BuildQuickFact(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(icon, color: Theme.of(context).colorScheme.primary),
            const SizedBox(width: 8),
            Text(label.toUpperCase(),
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: Theme.of(context).colorScheme.onSurfaceVariant)),
          ],
        ),
        Text(value,
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold)),
      ],
    );
  }
}
