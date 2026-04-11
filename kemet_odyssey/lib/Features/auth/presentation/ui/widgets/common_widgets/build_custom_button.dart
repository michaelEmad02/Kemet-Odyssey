import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';

// ─────────────────────────────────────────────
// Begin Exploration Button
// ─────────────────────────────────────────────

class BuilCustomButton extends StatelessWidget {
  const BuilCustomButton(
      {super.key, required this.title, required this.iconData, this.onPressed});
  final String title;
  final IconData iconData;
  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.2),
            blurRadius: 32,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: () => onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white.withOpacity(0.99),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(iconData,
                color: Colors.white.withOpacity(0.99), size: 20),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0);
  }
}
