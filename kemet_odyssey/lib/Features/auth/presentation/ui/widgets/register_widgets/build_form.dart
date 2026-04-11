import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/Core/theme/app_colors.dart';
import 'package:kemet_odyssey/Core/widgets/glassmorphic_container.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_custom_button.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/common_widgets/build_login_with_buttons.dart';
import 'package:kemet_odyssey/features/auth/presentation/ui/widgets/register_widgets/build_form_terms.dart';

class BuildForm extends StatefulWidget {
  const BuildForm({super.key});
  @override
  State<BuildForm> createState() => _BuildFormState();
}

class _BuildFormState extends State<BuildForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFieldLabel(theme, 'FULL NAME', delay: 400.ms),
        const SizedBox(height: 8),
        _buildTextField(
          theme: theme,
          hint: 'Your name, Pharaoh',
          icon: Icons.person_outline,
          delay: 500.ms,
        ),

        const SizedBox(height: 20),
        _buildFieldLabel(theme, 'EMAIL ADDRESS', delay: 500.ms),
        const SizedBox(height: 8),
        _buildTextField(
          theme: theme,
          hint: 'email@curator.com',
          icon: Icons.alternate_email,
          delay: 600.ms,
          keyboardType: TextInputType.emailAddress,
        ),

        const SizedBox(height: 20),
        _buildFieldLabel(theme, 'PASSWORD', delay: 600.ms),
        const SizedBox(height: 8),
        _buildTextField(
          theme: theme,
          hint: '••••••••',
          icon: Icons.lock_outline,
          delay: 700.ms,
          obscureText: obscurePassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscurePassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: theme.colorScheme.outline,
            ),
            onPressed: () => setState(() => obscurePassword = !obscurePassword),
          ),
        ),

        const SizedBox(height: 20),
        _buildFieldLabel(theme, 'CONFIRM PASSWORD', delay: 700.ms),
        const SizedBox(height: 8),
        _buildTextField(
          theme: theme,
          hint: '••••••••',
          icon: Icons.lock_outline,
          delay: 800.ms,
          obscureText: obscureConfirmPassword,
          suffixIcon: IconButton(
            icon: Icon(
              obscureConfirmPassword
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
              color: theme.colorScheme.outline,
            ),
            onPressed: () => setState(
                () => obscureConfirmPassword = !obscureConfirmPassword),
          ),
        ),

        const SizedBox(height: 12),

        // Terms
        BuildFormTerms(isDark: isDark, theme: theme)
            .animate()
            .fadeIn(delay: 900.ms),

        const SizedBox(height: 24),

        // CTA Button
        BuildCustomButton(
                title: "BEGIN EXPEDITION",
                iconData: Icons.explore,
                onPressed: () => context.goNamed('home'))
            .animate()
            .fadeIn(delay: 900.ms)
            .slideY(begin: 0.2, end: 0),

        const SizedBox(height: 32),

        // Divider
        Row(
          children: [
            Expanded(
                child: Divider(color: AppColors.darkPrimary.withOpacity(0.9))),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                'OR CONTINUE WITH',
                style: theme.textTheme.labelSmall
                    ?.copyWith(color: theme.colorScheme.outline),
              ),
            ),
            Expanded(
                child: Divider(color: AppColors.darkPrimary.withOpacity(0.9))),
          ],
        ).animate().fadeIn(delay: 1100.ms),

        const SizedBox(height: 24),

        // Social Buttons
        BuildLoginWithButtons(theme: theme)
            .animate()
            .fadeIn(delay: 1200.ms)
            .slideY(begin: 0.2, end: 0),
        const SizedBox(height: 40),

        BuildAlreadyHaveAccount(theme: theme, isDark: isDark),
      ],
    );
  }
}

class BuildAlreadyHaveAccount extends StatelessWidget {
  const BuildAlreadyHaveAccount({
    super.key,
    required this.theme,
    required this.isDark,
  });

  final ThemeData theme;
  final bool isDark;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
        TextSpan(
          text: 'Already Have Account? ',
          style: theme.textTheme.bodyMedium
              ?.copyWith(color: theme.colorScheme.onSurfaceVariant),
          children: [
            WidgetSpan(
              child: GestureDetector(
                onTap: () {
                  // if (context.canPop()) {
                  //   context.pop();
                  // } else {
                    context.goNamed('login');
                  // }
                },
                child: Text(
                  'Sign In',
                  style: theme.textTheme.bodyMedium?.copyWith(
                    color:
                        isDark ? AppColors.darkPrimary : AppColors.lightPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ).animate().fadeIn(delay: 1300.ms),
    );
  }
}

Widget _buildFieldLabel(ThemeData theme, String label,
    {required Duration delay}) {
  return Text(
    label,
    style: theme.textTheme.labelSmall?.copyWith(
      color: Colors.white.withOpacity(0.8),
      fontWeight: FontWeight.bold,
      letterSpacing: 1.5,
    ),
  ).animate().fadeIn(delay: delay);
}

Widget _buildTextField({
  required ThemeData theme,
  required String hint,
  required IconData icon,
  required Duration delay,
  bool obscureText = false,
  TextInputType? keyboardType,
  Widget? suffixIcon,
}) {
  return GlassmorphicContainer(
    borderRadius: BorderRadius.circular(12),
    overlayColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.15),
    border:
        Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.15)),
    child: TextField(
      obscureText: obscureText,
      keyboardType: keyboardType,
      style: theme.textTheme.bodyLarge,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: theme.colorScheme.outline.withOpacity(0.5),
        ),
        prefixIcon: Icon(icon, color: theme.colorScheme.outline),
        suffixIcon: suffixIcon,
        border: InputBorder.none,
        contentPadding:
            const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      ),
    ),
  ).animate().fadeIn(delay: delay).slideX(begin: 0.1, end: 0);
}
