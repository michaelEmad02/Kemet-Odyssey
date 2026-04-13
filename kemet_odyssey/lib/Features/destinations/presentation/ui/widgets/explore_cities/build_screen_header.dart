import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';

class BuildScreenHeader extends StatelessWidget {
  const BuildScreenHeader({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top + kToolbarHeight -20,
      ),
      sliver: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 4,
                height: 80,
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  boxShadow: [
                    BoxShadow(
                      color: theme.colorScheme.primary.withOpacity(0.5),
                      blurRadius: 15,
                    ),
                  ],
                ),
              )
                  .animate()
                  .fadeIn(delay: 200.ms)
                  .scaleY(alignment: Alignment.topCenter),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Explore Cities',
                      style: theme.textTheme.labelSmall?.copyWith(
                        color: isDark
                            ? AppColors.darkPrimary
                            : AppColors.lightPrimary,
                        letterSpacing: 3.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ).animate().fadeIn(delay: 400.ms),
                    const SizedBox(height: 8),
                    RichText(
                      text: TextSpan(
                        style: theme.textTheme.displayMedium?.copyWith(
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          height: 1.1,
                        ),
                        children: [
                          const TextSpan(text: 'Egyptian\n'),
                          TextSpan(
                            text: 'Cities',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontStyle: FontStyle.normal,
                              shadows: [
                                Shadow(
                                  color: theme.colorScheme.primary
                                      .withOpacity(0.2),
                                  blurRadius: 12,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        .animate()
                        .fadeIn(delay: 500.ms)
                        .slideX(begin: 0.1, end: 0),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
