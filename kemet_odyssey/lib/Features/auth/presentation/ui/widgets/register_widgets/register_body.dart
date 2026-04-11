import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/Core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/register_widgets/build_form.dart';

class RegisterBody extends StatelessWidget {
  const RegisterBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          children: [
            SizedBox(height: 0),
            // Header
            BuildHeader(),

            SizedBox(height: 40),

            // Form
            BuildForm(),

            SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

class BuildHeader extends StatelessWidget {
  const BuildHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Column(
      children: [
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: theme.colorScheme.surfaceContainerHighest,
            border: Border.all(
                color: theme.colorScheme.outlineVariant.withOpacity(0.2)),
            boxShadow: [
              BoxShadow(
                color: AppColors.darkPrimary.withOpacity(0.3),
                blurRadius: 20,
                spreadRadius: 2,
              )
            ],
          ),
          child: Icon(
            Icons.temple_hindu,
            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
            size: 32,
          ),
        ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 10),
        Text(
          'Create Account',
          style: theme.textTheme.displaySmall?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkPrimary : AppColors.darkPrimary,
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
        const SizedBox(height: 15),
        Text(
          'CREATE YOUR CURATOR PROFILE',
          style: theme.textTheme.labelSmall?.copyWith(
            color: Colors.white.withOpacity(0.8),
            letterSpacing: 2.5,
          ),
        ).animate().fadeIn(delay: 300.ms),
      ],
    );
  }
}
