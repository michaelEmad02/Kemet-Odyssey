import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_actions_list.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_analystics.dart';
import 'package:kemet_odyssey/features/profile/presentation/ui/widgets/profile/build_profile_hero.dart';

class BuildProfileBody extends StatelessWidget {
  const BuildProfileBody({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Profile Hero
        BuildProfileHero(theme: theme).animate().fadeIn(delay: 200.ms).scaleXY(begin: 0.9, end: 1),
    
        const SizedBox(height: 20),
        Text(
          'Ramses II',
          style: theme.textTheme.displaySmall?.copyWith(
              fontWeight: FontWeight.bold, fontStyle: FontStyle.italic),
        ).animate().fadeIn(delay: 300.ms),
        const SizedBox(height: 4),
        Text(
          'GRAND CURATOR STATUS',
          style: theme.textTheme.labelSmall?.copyWith(
              color: theme.colorScheme.primary, letterSpacing: 2),
        ).animate().fadeIn(delay: 400.ms),
    
        const SizedBox(height: 40),
    
        // Stats Bento Grid
       BuildAnalystics(theme : theme),
    
        const SizedBox(height: 40),
    
        // Actions List
        Align(
          alignment: Alignment.centerLeft,
          child: Text('Legacy & Account',
              style: theme.textTheme.titleLarge
                  ?.copyWith(fontStyle: FontStyle.italic)),
        ).animate().fadeIn(delay: 700.ms),
    
        const SizedBox(height: 16),
    
        BuildActionsList(theme: theme).animate().fadeIn(delay: 800.ms).slideY(begin: 0.1, end: 0),
      ],
    );
  }
}
