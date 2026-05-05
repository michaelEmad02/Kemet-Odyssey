import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:kemet_odyssey/Core/widgets/glassmorphic_container.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField(
      {super.key,
      required this.theme,
      required this.hint,
      required this.icon,
      required this.delay,
      required this.keyboardType,
      required this.suffixIcon,
      required this.obscureText,
      required this.controller});
  final ThemeData theme;
  final TextEditingController controller;
  final String hint;
  final IconData icon;
  final Duration delay;
  final bool obscureText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      borderRadius: BorderRadius.circular(12),
      overlayColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.15),
      border:
          Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.15)),
      child: TextField(
        controller: controller,
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
}
