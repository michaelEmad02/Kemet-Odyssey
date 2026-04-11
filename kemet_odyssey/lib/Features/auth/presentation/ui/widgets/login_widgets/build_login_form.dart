import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_custom_button.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_login_with_buttons.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/login_widgets/build_text_field.dart';

class BuildLoginForm extends StatelessWidget {
  const BuildLoginForm({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Email',
          style: theme.textTheme.labelSmall?.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(delay: 400.ms),
        const SizedBox(height: 8),
        BuildTextField(
          theme: theme,
          obscureText: false,
          hintText: "email@kemet.com",
          prefixIcon:
              Icon(Icons.alternate_email, color: theme.colorScheme.outline),
        ).animate().fadeIn(delay: 500.ms).slideX(begin: 0.1, end: 0),
        const SizedBox(height: 24),
        Text(
          'Password',
          style: theme.textTheme.labelSmall?.copyWith(
            color: Colors.white.withOpacity(0.7),
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn(delay: 600.ms),
        const SizedBox(height: 8),
        BuildTextField(
          theme: theme,
          obscureText: true,
          hintText: '••••••••',
          prefixIcon:
              Icon(Icons.lock_outline, color: theme.colorScheme.outline),
        ).animate().fadeIn(delay: 700.ms).slideX(begin: 0.1, end: 0),
        const SizedBox(height: 8),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Forget Password?',
              style: theme.textTheme.labelSmall?.copyWith(
                color: isDark ? AppColors.darkPrimary : AppColors.darkPrimary,
              ),
            ),
          ),
        ).animate().fadeIn(delay: 800.ms),
        const SizedBox(height: 16),
        BuildCustomButton(
          title: "SIGN IN",
          iconData: Icons.arrow_forward,
          onPressed: () => context.goNamed('home'),
        ).animate().fadeIn(delay: 900.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 32),
        Row(
          children: [
            Expanded(
                child: Divider(color: AppColors.darkPrimary.withOpacity(0.6))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'OR CONTINUE WITH',
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: AppColors.darkPrimary),
              ),
            ),
            Expanded(
                child: Divider(color: AppColors.darkPrimary.withOpacity(0.6))),
          ],
        ).animate().fadeIn(delay: 1000.ms),
        const SizedBox(height: 24),
        BuildLoginWithButtons(theme: theme)
            .animate()
            .fadeIn(delay: 1100.ms)
            .slideY(begin: 0.2, end: 0),
      ],
    );
  }
}
