import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/build_login_form.dart';

class LoginScreenBody extends StatelessWidget {
  const LoginScreenBody({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 24.0),
        child: Column(
          children: [
            const SizedBox(height: 24),
            // Logo
            buildLogo(),

            const SizedBox(height: 48),

            // Forms
            BuildLoginForm(theme: theme, isDark: isDark),

            const SizedBox(height: 48),
            BuildRegister(theme: theme, isDark: isDark)
                .animate()
                .fadeIn(delay: 1200.ms),
          ],
        ),
      ),
    );
  }

  Column buildLogo() {
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
                color: AppColors.darkPrimary.withOpacity(0.2),
                blurRadius: 15,
              )
            ],
          ),
          child: Icon(
            Icons.temple_hindu,
            color: isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
            size: 32,
          ),
        ).animate().scale(duration: 600.ms, curve: Curves.easeOutBack),
        const SizedBox(height: 16),
        Text(
          'Kemet Odyssey',
          style: theme.textTheme.displaySmall?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkPrimary : AppColors.darkPrimary,
          ),
        ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1, end: 0),
        const SizedBox(height: 8),
        /*Text(
                'DIGITAL CURATOR',
                style: theme.textTheme.labelSmall?.copyWith(
                  color: Colors.white,
                  letterSpacing: 2.5,
                ),
              ).animate().fadeIn(delay: 300.ms),*/
      ],
    );
  }
}

class BuildRegister extends StatelessWidget {
  const BuildRegister({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      TextSpan(
        text: 'New to the expedition? ',
        style: theme.textTheme.bodySmall
            ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
        children: [
          WidgetSpan(
            child: GestureDetector(
              onTap: () {
                context.pushNamed('register');
              },
              child: Text(
                'Create Account',
                style: theme.textTheme.bodySmall?.copyWith(
                  color:
                      isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
