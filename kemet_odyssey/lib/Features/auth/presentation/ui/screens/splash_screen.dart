import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:kemet_odyssey/Core/theme/app_colors.dart';
import 'package:kemet_odyssey/Features/auth/presentation/ui/widgets/splash_widget/begin_explorationButton.dart';
import 'package:kemet_odyssey/Features/auth/presentation/ui/widgets/splash_widget/footer.dart';
import 'package:kemet_odyssey/Features/auth/presentation/ui/widgets/splash_widget/splash_screen_signin_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          _BackgroundImage(),
          _GradientOverlay(),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 48.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _BrandSection(),
                  _ActionsSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Background Image
// ─────────────────────────────────────────────

class _BackgroundImage extends StatelessWidget {
  const _BackgroundImage();

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Image.asset(
      'assets/images/image9.png',
      fit: BoxFit.cover,
      color: Colors.black.withOpacity(isDark ? 0.00 : 0.05),
      colorBlendMode: BlendMode.darken,
    ).animate().fadeIn(duration: 1.seconds);
  }
}

// ─────────────────────────────────────────────
// Gradient Overlay
// ─────────────────────────────────────────────

class _GradientOverlay extends StatelessWidget {
  const _GradientOverlay();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            theme.scaffoldBackgroundColor.withOpacity(0.8),
            Colors.transparent.withOpacity(0.1),
            Colors.transparent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
    );
  }
}

// ─────────────────────────────────────────────
// Brand Section (Title + Tagline)
// ─────────────────────────────────────────────

class _BrandSection extends StatelessWidget {
  const _BrandSection();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    return Column(
      children: [
        const SizedBox(height: 100),
        const SizedBox(height: 24),
        Text(
          'Kemet Odyssey',
          textAlign: TextAlign.center,
          style: theme.textTheme.displayLarge?.copyWith(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: isDark ? AppColors.darkPrimary : AppColors.darkPrimary,
            shadows: [
              Shadow(
                color: AppColors.darkPrimary.withOpacity(0.1),
                blurRadius: 20,
              ),
            ],
          ),
        ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.2, end: 0),
        const SizedBox(height: 30),
        Text(
          'Begin Your Odyssey Through Ancient Egypt',
          style: theme.textTheme.labelLarge?.copyWith(
            color: Colors.white.withOpacity(0.9),
            letterSpacing: 2.0,
            overflow: TextOverflow.clip,
          ),
        ).animate().fadeIn(delay: 500.ms),
      ],
    );
  }
}

// ─────────────────────────────────────────────
// Actions Section (Buttons + Footer)
// ─────────────────────────────────────────────

class _ActionsSection extends StatelessWidget {
  const _ActionsSection();

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        BeginExplorationButton(),
        SizedBox(height: 16),
        SignInButton(),
        SizedBox(height: 48),
        FooterQuote(),
      ],
    );
  }
}



