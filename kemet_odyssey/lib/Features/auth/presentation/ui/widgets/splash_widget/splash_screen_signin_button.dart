// ─────────────────────────────────────────────
// Sign In Button
// ─────────────────────────────────────────────

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/Core/widgets/glassmorphic_container.dart';

class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return GlassmorphicContainer(
      blur: 20,
      borderRadius: BorderRadius.circular(15),
      overlayColor: isDark
          ? const Color(0x99353535)
          : const Color.fromARGB(190, 255, 255, 255),
      border:
          Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
      child: InkWell(
        onTap: () => context.pushNamed('login'),
        borderRadius: BorderRadius.circular(15),
        child: SizedBox(
          width: double.infinity,
          height: 60,
          child: Center(
            child: Text(
              'SIGN IN',
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.colorScheme.onSurface,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    ).animate().fadeIn(delay: 800.ms).slideY(begin: 0.2, end: 0);
  }
}
