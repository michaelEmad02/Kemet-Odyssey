import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/core/utils/service_locator.dart';
import 'package:kemet_odyssey/features/destinations/presentation/manager/cubit/fetch_place_details_cubit.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/place_details/build_place_details_body.dart';

class PlaceDetailsScreen extends StatefulWidget {
  final int placeId;

  const PlaceDetailsScreen({super.key, required this.placeId});

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark; // 1=Mon..7=Sun

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: _buildAppBar(theme, isDark, context),
      // bottomNavigationBar: BuildBottomNavBar(theme: theme, isDark: isDark),
      body: BlocProvider(
        create: (context) => getIt<FetchPlaceDetailsCubit>()
          ..fetchPlaceDetails(id: widget.placeId),
        child: BuildPlaceDetailsBody(theme: theme),
      ),
    );
  }

  AppBar _buildAppBar(ThemeData theme, bool isDark, BuildContext context) {
    return AppBar(
      flexibleSpace: ClipRect(
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
          child: Container(color: Colors.transparent),
        ),
      ),
      backgroundColor: theme.scaffoldBackgroundColor.withOpacity(0.8),
      leading: Padding(
        padding: const EdgeInsets.all(8.0),
        child: IconButton(
          icon: Icon(Icons.arrow_back,
              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary),
          onPressed: () => Navigator.of(context).pop(),
          style: IconButton.styleFrom(
            backgroundColor: theme.colorScheme.surface.withOpacity(0.5),
          ),
        ),
      ),
      title: Text(
        'Kemet Odyssey',
        style: theme.textTheme.titleLarge?.copyWith(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
        ),
      ),
      actions: [
        IconButton(
          icon: AnimatedSwitcher(
            duration: 300.ms,
            child: Icon(
              _isFavorited ? Icons.bookmark : Icons.bookmark_border,
              key: ValueKey(_isFavorited),
              color: _isFavorited
                  ? (isDark ? AppColors.darkPrimary : AppColors.lightPrimary)
                  : theme.colorScheme.onSurfaceVariant,
            ),
          ),
          onPressed: () => setState(() => _isFavorited = !_isFavorited),
        ),
        IconButton(
          icon: Icon(Icons.share, color: theme.colorScheme.onSurfaceVariant),
          onPressed: () {},
        ),
        const SizedBox(width: 8),
      ],
    );
  }
}

class BuildGalleryImage extends StatelessWidget {
  const BuildGalleryImage({super.key, required this.url});
  final String url;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 6),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: CachedNetworkImage(
          imageUrl: url,
          fit: BoxFit.cover,
          width: double.infinity,
        ),
      ),
    );
  }
}

class BuildHorizontalDivider extends StatelessWidget {
  const BuildHorizontalDivider({super.key, required this.theme});
  final ThemeData theme;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 1,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.transparent,
              theme.colorScheme.primary.withOpacity(0.3),
              Colors.transparent
            ],
          ),
        ),
      ),
    );
  }
}


class BuildFactRow extends StatelessWidget {
  const BuildFactRow(
      {super.key,
      required this.icon,
      required this.label,
      required this.value});
  final IconData icon;
  final String label;
  final String value;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary.withOpacity(0.08),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Icon(icon, color: theme.colorScheme.primary, size: 18),
        ),
        const SizedBox(width: 16),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(label,
                style: theme.textTheme.labelSmall?.copyWith(
                    color: theme.colorScheme.onSurfaceVariant,
                    letterSpacing: 1)),
            Text(value,
                style: theme.textTheme.bodyLarge
                    ?.copyWith(fontWeight: FontWeight.bold)),
          ],
        ),
      ],
    );
  }
}
