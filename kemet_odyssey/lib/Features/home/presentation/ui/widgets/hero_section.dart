import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'The Land of Kemet',
            style: theme.textTheme.bodyMedium?.copyWith(
              color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
              letterSpacing: 3.0,
              fontWeight: FontWeight.bold,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
          const SizedBox(height: 8),
          Text(
            'Your Odyssey\nBegins Here.',
            style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.1,
            ),
          ).animate().fadeIn(delay: 400.ms).slideX(begin: 0.1, end: 0),
        ],
      ),
    );
  }
}
