import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/destinations/presentation/ui/widgets/city_details/build_city_details_body.dart';

class CityDetailsScreen extends StatelessWidget {
  const CityDetailsScreen({super.key, required this.cityId});
  final int cityId;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(theme, isDark, context),
      body: BuildCityDetailsBody(
        theme: theme,
        cityId: cityId,
      ),
    );
  }

  AppBar buildAppBar(ThemeData theme, bool isDark, BuildContext context) {
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
      // actions: [
      //   IconButton(
      //     icon: Icon(Icons.share, color: theme.colorScheme.onSurfaceVariant),
      //     onPressed: () {},
      //   ),
      //   const SizedBox(width: 8),
      // ],
    );
  }
}
