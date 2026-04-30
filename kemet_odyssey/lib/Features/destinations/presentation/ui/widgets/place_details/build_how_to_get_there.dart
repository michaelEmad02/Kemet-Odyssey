import 'package:flutter/material.dart';
import 'package:kemet_odyssey/features/destinations/data/models/location_model.dart';
import 'package:url_launcher/url_launcher.dart';

class BuildHowToGetThere extends StatelessWidget {
  const BuildHowToGetThere({
    super.key,
    required this.theme,
    required this.location,
  });

  final ThemeData theme;
  final LocationModel location;

  Future<void> _openGoogleMaps(BuildContext context) async {
    final destination = '${location.latitude},${location.longitude}';
    final directionsUri = Uri.parse(
      'https://www.google.com/maps/dir/?api=1&destination=$destination&travelmode=driving',
    );
    final searchUri = Uri.parse(
      'https://www.google.com/maps/search/?api=1&query=$destination',
    );

    final openedDirections = await launchUrl(
      directionsUri,
      mode: LaunchMode.externalApplication,
    );
    if (openedDirections) {
      return;
    }

    final openedSearch = await launchUrl(
      searchUri,
      mode: LaunchMode.externalApplication,
    );
    if (openedSearch || !context.mounted) {
      return;
    }

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Could not open Google Maps.'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _openGoogleMaps(context),
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: theme.colorScheme.surfaceContainer,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: theme.colorScheme.secondary.withOpacity(0.1),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.near_me_outlined,
                  color: theme.colorScheme.secondary, size: 28),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Getting There',
                    style: theme.textTheme.titleMedium
                        ?.copyWith(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Tap to open directions for '
                    '${location.latitude.toStringAsFixed(5)}, '
                    '${location.longitude.toStringAsFixed(5)}',
                    style: theme.textTheme.bodySmall?.copyWith(
                        color: theme.colorScheme.onSurfaceVariant),
                  ),
                ],
              ),
            ),
            Icon(Icons.chevron_right,
                color: theme.colorScheme.onSurfaceVariant),
          ],
        ),
      ),
    );
  }
}
