import 'package:flutter/material.dart';
import 'package:kemet_odyssey/Core/theme/app_colors.dart';

class BuildFormTerms extends StatelessWidget {
  const BuildFormTerms({
    super.key,
    required this.isDark,
    required this.theme,
  });

  final bool isDark;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: true,
          onChanged: (_) {},
          activeColor:
              isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(4)),
        ),
        Expanded(
          child: Text.rich(
            TextSpan(
              text: 'I accept the ',
              style: theme.textTheme.bodySmall
                  ?.copyWith(color: Colors.white.withOpacity(0.8)),
              children: [
                TextSpan(
                  text: 'Curator\'s Charter',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.darkPrimary
                        : AppColors.darkPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const TextSpan(text: ' & Privacy Scrolls.'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}