import 'package:flutter/material.dart';
import 'package:kemet_odyssey/core/theme/app_colors.dart';

// ─────────────────────────────────────────────
// Begin Exploration Button
// ─────────────────────────────────────────────

class BuildCustomButton extends StatelessWidget {
  const BuildCustomButton(
      {super.key, required this.title, required this.iconData, this.onPressed});
  final Widget title;
  final IconData iconData;
  final VoidCallback? onPressed; 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.darkPrimary.withOpacity(0.2),
            blurRadius: 32,
          ),
        ],
      ),
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          minimumSize: const Size(double.infinity, 60),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            title,
            const SizedBox(width: 8),
            Icon(iconData,
                color: Colors.white.withOpacity(0.99), size: 20),
          ],
        ),
      ),
    );
  }
}
