
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/Core/theme/app_colors.dart';

// ─────────────────────────────────────────────
// Begin Exploration Button
// ─────────────────────────────────────────────


class BeginExplorationButton extends StatelessWidget {
  const BeginExplorationButton({super.key});

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
        onPressed: () => context.goNamed('home'),
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'BEGIN EXPLORATION',
              style: theme.textTheme.labelLarge?.copyWith(
                color: Colors.white.withOpacity(0.99),
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(width: 8),
            Icon(Icons.arrow_forward,
                color: Colors.white.withOpacity(0.99), size: 20),
          ],
        ),
      ),
    ).animate().fadeIn(delay: 700.ms).slideY(begin: 0.2, end: 0);
  }
}

