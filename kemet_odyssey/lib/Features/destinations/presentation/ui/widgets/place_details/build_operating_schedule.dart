import 'package:flutter/material.dart';

class BuildOperatingSchedule extends StatelessWidget {
  const BuildOperatingSchedule({
    super.key,
    required List<Map<String, String>> schedule,
    required this.today, required this.theme,
  }) : _schedule = schedule;

  final List<Map<String, String>> _schedule;
  final int today;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: theme.colorScheme.primary.withOpacity(0.05),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          BuildHeader(theme: theme),

          const SizedBox(height: 20),
    
          // Weekly Schedule Grid
          ...List.generate(_schedule.length, (i) {
            final day = _schedule[i];
            final isToday = (today == i + 1); // Mon=1..Sun=7
            return Container(
              margin: const EdgeInsets.only(bottom: 8),
              padding: const EdgeInsets.symmetric(
                  horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isToday
                    ? theme.colorScheme.primary.withOpacity(0.12)
                    : theme.colorScheme.surfaceContainerHigh,
                borderRadius: BorderRadius.circular(12),
                border: isToday
                    ? Border.all(
                        color: theme.colorScheme.primary
                            .withOpacity(0.3))
                    : null,
              ),
              child: Row(
                children: [
                  SizedBox(
                    width: 44,
                    child: Text(
                      day['day']!,
                      style: theme.textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: isToday
                            ? theme.colorScheme.primary
                            : theme.colorScheme.onSurfaceVariant,
                      ),
                    ),
                  ),
                  if (isToday)
                    Container(
                      margin: const EdgeInsets.only(right: 12),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'TODAY',
                        style:
                            theme.textTheme.labelSmall?.copyWith(
                          color: theme.colorScheme.onPrimary,
                          fontSize: 9,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  const Spacer(),
                  Text(
                    '${day['open']} – ${day['close']}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight:
                          isToday ? FontWeight.bold : FontWeight.normal,
                      color: isToday
                          ? theme.colorScheme.primary
                          : null,
                    ),
                  ),
                ],
              ),
            );
          }),
    
          const SizedBox(height: 12),
          Text(
            '* Recommended to visit at sunrise for the best light and cooler temperatures.',
            style: theme.textTheme.bodySmall?.copyWith(
              color: theme.colorScheme.secondary,
              fontStyle: FontStyle.italic,
            ),
          ),
        ],
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal:10),
      leading:Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color:
                theme.colorScheme.primary.withOpacity(0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Icon(Icons.schedule_outlined,
              color: theme.colorScheme.primary, size: 28),
        ),
        title: Text(
              'Operating Hours',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontWeight: FontWeight.bold),
            ),
            subtitle:Text(
              'Schedule may vary on public holidays',
              style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurfaceVariant),
            ) ,
    );
  }
}
