import 'package:flutter/material.dart';

class BuildLoginWithButtons extends StatelessWidget {
  const BuildLoginWithButtons({
    super.key,
    required this.theme,
  });

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
            ),
            child: const Center(child: Icon(Icons.g_mobiledata, size: 32)),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: Container(
            height: 50,
            decoration: BoxDecoration(
              color: theme.colorScheme.surfaceContainer,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(
                  color: theme.colorScheme.outlineVariant.withOpacity(0.1)),
            ),
            child: const Center(child: Icon(Icons.apple, size: 24)),
          ),
        ),
      ],
    );
  }
}