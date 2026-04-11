import 'package:flutter/material.dart';
import 'package:kemet_odyssey/core/widgets/glassmorphic_container.dart';

class BuildTextField extends StatelessWidget {
  const BuildTextField({
    super.key,
    required this.theme,
    required this.hintText,
    required this.prefixIcon,
    required this.obscureText,
  });

  final ThemeData theme;
  final String hintText;
  final bool obscureText;
  final Icon prefixIcon;

  @override
  Widget build(BuildContext context) {
    return GlassmorphicContainer(
      borderRadius: BorderRadius.circular(12),
      overlayColor: theme.colorScheme.surfaceContainerHighest.withOpacity(0.4),
      border:
          Border.all(color: theme.colorScheme.outlineVariant.withOpacity(0.15)),
      child: TextField(
        obscureText: obscureText,
        style: theme.textTheme.bodyLarge,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: theme.textTheme.bodyLarge
              ?.copyWith(color: theme.colorScheme.outline.withOpacity(0.5)),
          prefixIcon: prefixIcon,
          border: InputBorder.none,
          contentPadding:
              const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        ),
      ),
    );
  }
}
